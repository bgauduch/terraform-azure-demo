# fetch existing resource from name (easier than ids)
# ability to filter them with tags

data "azurerm_resource_group" "demo1_rg" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "demo1_vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.demo1_rg.name
}

data "azurerm_subnet" "demo1_subnet" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.demo1_vnet.name
  resource_group_name  = data.azurerm_resource_group.demo1_rg.name
}

