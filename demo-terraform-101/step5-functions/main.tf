# Create a Resource Group
resource "azurerm_resource_group" "demo_step5_rg" {
  name     = "demo_step5_rg"
  location = "West Europe"

  tags = {
    environment = "production"
  }
}

# Create a vNET inside the Resource Group
resource "azurerm_virtual_network" "demo_step5_vnet" {
  name                = "demo_step5_vnet"
  location            = azurerm_resource_group.demo_step5_rg.location
  resource_group_name = azurerm_resource_group.demo_step5_rg.name

  address_space = ["10.0.0.0/16"]

  tags = {
    environment = "production"
  }
}

# Create multiple subnet inside the vNET
resource "azurerm_subnet" "demo_step5_subnet" {
  # Iteration on this resource, using the input variable and the "count" resource meta-parameter
  # This will create as many resource as the number spécified in the variable
  count = var.subnet_number

  # Using interpolation and "count" index to build the subnet resource name (each name needs to be unique)
  name                 = "demo_step5_subnet_${count.index}"
  resource_group_name  = azurerm_resource_group.demo_step5_rg.name
  virtual_network_name = azurerm_virtual_network.demo_step5_vnet.name

  # Using function to calculate the subnet CIDR from the existing vNET, using interpolation to retrieve the existing vNET address space
  address_prefix = cidrsubnet(azurerm_virtual_network.demo_step5_vnet.address_space[0], 8, count.index)
}
