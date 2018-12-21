/**
* Public IP
**/
resource "azurerm_public_ip" "public_ip" {
  name                         = "${var.env}_public_ip"
  location                     = "${var.location}"
  resource_group_name          = "${var.resource_group_name}"
  public_ip_address_allocation = "Static"

  tags {
    environment = "${var.env}"
  }
}

/**
* NIC
**/
resource "azurerm_network_interface" "nic" {
  name                = "${var.env}_nic"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  ip_configuration {
    name                          = "${var.env}-nic-ip-config"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.public_ip.id}"
  }

  tags {
    environment = "${var.env}"
  }
}

/**
* VM
**/
resource "azurerm_virtual_machine" "vm" {
  name                = "${var.env}_vm"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  network_interface_ids         = ["${azurerm_network_interface.nic.id}"]
  vm_size                       = "${var.vm_size}"
  delete_os_disk_on_termination = true

  tags {
    environment = "${var.env}"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "${var.ubuntu_version}"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.env}_vm_os_disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.env}-vm"
    admin_username = "${var.user_name}"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/${var.user_name}/.ssh/authorized_keys"
      key_data = "${var.ssh_key_public_path}"
    }
  }

  # the default connection config for provisioners
  connection {
    type        = "ssh"
    user        = "${var.user_name}"
    timeout     = "60s"
    private_key = "${var.ssh_key_private_path}"
    host        = "${azurerm_public_ip.public_ip.ip_address}"
  }

  # execute remote commands
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y",
    ]
  }
}
