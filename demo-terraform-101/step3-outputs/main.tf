# Configure the Azure Provider
provider "azurerm" {
  version = "=1.27.1"
}

# Create a Resource Group
resource "azurerm_resource_group" "demo_step3_rg" {
  name     = "demo_step3_rg"
  location = "West Europe"
  tags {
    environment = "production"
  }
}
