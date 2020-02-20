resource "azurerm_subnet" "demo_step6_subnet" {
  name = "demo_step6_subnet"

  # This subnet belong to the previously created Resource Group
  # let's use interpolation on datasource to retrieve the existing Resource Group name
  resource_group_name = data.azurerm_resource_group.demo_step6_rg.name

  # This subnet belong to the previously created vNET
  # let's use interpolation on datasource to create the link
  virtual_network_name = data.azurerm_virtual_network.demo_step6_vnet.name

  # Calculate the subnet CIDR from the existing vNET, using interpolation to retrieve the vNET address space:
  address_prefix = cidrsubnet(data.azurerm_virtual_network.demo_step6_vnet.address_spaces[0], 8, 1)
}
