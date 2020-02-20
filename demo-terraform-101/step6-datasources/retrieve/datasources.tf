# Retrieve the existing Resource Group named "rg"
data "azurerm_resource_group" "demo_step6_rg" {
  name = "demo_step6_rg"
}

# Retrieve existing vNET named "vnet"
data "azurerm_virtual_network" "demo_step6_vnet" {
  name                = "demo_step6_vnet"
  resource_group_name = data.azurerm_resource_group.demo_step6_rg.name
}
