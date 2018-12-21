/**
* vNET
**/
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.env}_vnet"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  address_space = ["${var.vnet_range}"]

  tags {
    environment = "${var.env}"
  }
}

/**
* Subnet
**/
resource "azurerm_subnet" "subnet" {
  name                 = "${var.env}_subnet"
  resource_group_name  = "${var.resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"

  address_prefix = "${cidrsubnet(var.vnet_range, 8, 1)}"
}
