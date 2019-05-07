# Configure the Azure Provider
provider "azurerm" {
  version = "=1.27.1"
}

# Create a Resource Group
resource "azurerm_resource_group" "demo_step4_rg" {
  name     = "demo_step4_rg"
  location = "West Europe"

  tags {
    environment = "production"
  }
}

# Create a vNET inside the Resource Group
resource "azurerm_virtual_network" "demo_step4_vnet" {
  name = "demo_step4_vnet"

  # Use existing attributes from previously created Resource Group
  # This create a dependancy between between this vNET and the Resource Group
  location = "${azurerm_resource_group.demo_step4_rg.location}"
  resource_group_name = "${azurerm_resource_group.demo_step4_rg.name}"

  address_space = ["10.0.0.0/16"]

  tags {
    environment = "production"
  }
}
