# Create a Resource Group
resource "azurerm_resource_group" "demo_step1_rg" {
  name     = "demo_step1_rg"
  location = "West Europe"

  tags = {
    environment = "production"
  }
}
