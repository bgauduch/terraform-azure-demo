### vNET
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.env}_vnet"
  location            = var.location
  resource_group_name = var.resource_group_na

  address_space = [var.vnet_range]

  tags {
    environment = var.env
  }
}

### Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "${var.env}_subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefix = cidrsubnet(var.vnet_range, 8, 1)
}

/**
* Create the subnet NSG
**/
resource "azurerm_network_security_group" "nsg" {
  name                = "${var.env}_nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

/**
* Add a rule to the NSG: allow HTTP in
**/
resource "azurerm_network_security_rule" "nsg_rule_http_allow" {
  name                        = "${var.env}_nsg_rule_http_allow_bga"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.resource_group_name
}

### Bind the NSG to the subnet
resource "azurerm_subnet_network_security_group_association" "demo1_subnet_nsg_bind" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
