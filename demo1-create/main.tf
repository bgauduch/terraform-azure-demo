### Resource Group
resource "azurerm_resource_group" "demo1_rg" {
  name     = var.resource_group_name
  location = var.azure_region
  tags = {
    environment = var.environment_tag
  }
}

### Create the subnet NSG
resource "azurerm_network_security_group" "demo1_nsg" {
  name                = "demo1_nsg"
  location            = azurerm_resource_group.demo1_rg.location
  resource_group_name = azurerm_resource_group.demo1_rg.name
}

### Add a rule to the NSG: allow HTTP in
resource "azurerm_network_security_rule" "demo1_nsg_rule_http_allow" {
  name                        = "demo1_nsg_rule_http_allow"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.demo1_rg.name
  network_security_group_name = azurerm_network_security_group.demo1_nsg.name
}

### vNET
resource "azurerm_virtual_network" "demo1_vnet" {
  name                = "demo1_vnet"
  location            = azurerm_resource_group.demo1_rg.location
  resource_group_name = azurerm_resource_group.demo1_rg.name # link on resource attribut for dependancy handling

  address_space = [var.vnet_range]

  tags = {
    environment = var.environment_tag
  }
}

### Subnet
resource "azurerm_subnet" "demo1_subnet" {
  name                 = "demo1_subnet"
  resource_group_name  = azurerm_resource_group.demo1_rg.name
  virtual_network_name = azurerm_virtual_network.demo1_vnet.name

  address_prefix = cidrsubnet(var.vnet_range, 8, 1)
}

### Bind the NSG to the subnet
resource "azurerm_subnet_network_security_group_association" "demo1_subnet_nsg_bind" {
  subnet_id                 = azurerm_subnet.demo1_subnet.id
  network_security_group_id = azurerm_network_security_group.demo1_nsg.id
}

### Public IP
resource "azurerm_public_ip" "demo1_public_ip" {
  name                = "demo1_public_ip_test"
  location            = azurerm_resource_group.demo1_rg.location
  resource_group_name = azurerm_resource_group.demo1_rg.name
  ip_version          = "ipv4"
  allocation_method   = "Static"
  domain_name_label   = "demo1-public-ip-bga" # Must be unique worldwide!

  tags = {
    environment = var.environment_tag
  }
}

### NIC
resource "azurerm_network_interface" "demo1_nic" {
  name                = "demo1_nic"
  location            = azurerm_resource_group.demo1_rg.location
  resource_group_name = azurerm_resource_group.demo1_rg.name

  ip_configuration {
    name                          = "nic-ip-config"
    subnet_id                     = azurerm_subnet.demo1_subnet.id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = azurerm_public_ip.demo1_public_ip.id
  }

  tags = {
    environment = var.environment_tag
  }
}

### Setup Cloudinit script
data "template_file" "demo1_cloudinit_file" {
  template = file(var.cloudinit_script_path)
}

data "template_cloudinit_config" "demo1_vm_cloudinit_script" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = data.template_file.demo1_cloudinit_file.rendered
  }
}

### VM
resource "azurerm_virtual_machine" "demo1_vm" {
  name                = "demo1_vm"
  location            = azurerm_resource_group.demo1_rg.location
  resource_group_name = azurerm_resource_group.demo1_rg.name

  network_interface_ids         = [azurerm_network_interface.demo1_nic.id]
  vm_size                       = var.vm_size
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = var.ubuntu_version
    version   = "latest"
  }

  storage_os_disk {
    name              = "demo1_vm_os_disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "demo1-vm"
    admin_username = var.user_name
    custom_data    = data.template_cloudinit_config.demo1_vm_cloudinit_script.rendered
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/${var.user_name}/.ssh/authorized_keys"
      key_data = file("${path.module}/ssh/azure-vm-rsa.pub")
    }
  }

  # # the default connection config for provisioners
  # connection {
  #   type        = "ssh"
  #   user        = "${var.user_name}"
  #   timeout     = "60s"
  #   private_key = "${file("${path.module}/ssh/azure-vm-rsa")}"
  #   host        = "${azurerm_public_ip.demo1_public_ip.ip_address}"
  # }

  # # execute remote commands
  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo apt update",
  #     "sudo apt install nginx -y",
  #   ]
  # }

  tags = {
    environment = var.environment_tag
  }
}

