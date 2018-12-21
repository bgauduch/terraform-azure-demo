/**
* Public IP
**/
resource "azurerm_public_ip" "demo2_public_ip" {
  name                         = "demo2_public_ip"
  location                     = "${data.azurerm_resource_group.demo1_rg.location}"
  resource_group_name          = "${data.azurerm_resource_group.demo1_rg.name}"
  public_ip_address_allocation = "Static"
}

/**
* NIC
**/
resource "azurerm_network_interface" "demo2_nic" {
  name                = "demo2_nic"
  location            = "${data.azurerm_resource_group.demo1_rg.location}"
  resource_group_name = "${data.azurerm_resource_group.demo1_rg.name}"

  ip_configuration {
    name                          = "nic-ip-config"
    subnet_id                     = "${data.azurerm_subnet.demo1_subnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.demo2_public_ip.id}"
  }
}

/**
* VM
**/
resource "azurerm_virtual_machine" "demo2_vm" {
  name                = "demo2_vm"
  location            = "${data.azurerm_resource_group.demo1_rg.location}"
  resource_group_name = "${data.azurerm_resource_group.demo1_rg.name}"

  network_interface_ids         = ["${azurerm_network_interface.demo2_nic.id}"]
  vm_size                       = "${var.vm_size}"
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "${var.ubuntu_version}"
    version   = "latest"
  }

  storage_os_disk {
    name              = "demo2_vm_os_disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "tf-iac-vm-demo2"
    admin_username = "${var.user_name}"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/${var.user_name}/.ssh/authorized_keys"
      key_data = "${file("${path.module}/ssh/azure-vm-rsa.pub")}"
    }
  }

  # the default connection config for provisioners
  connection {
    type        = "ssh"
    user        = "${var.user_name}"
    timeout     = "60s"
    private_key = "${file("${path.module}/ssh/azure-vm-rsa")}"
    host        = "${azurerm_public_ip.demo2_public_ip.ip_address}"
  }

  # execute remote commands
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y",
    ]
  }
}
