# Create a Resource Group
resource "azurerm_resource_group" "demo_step2_rg" {
  # Read variables values to setup attributes
  name     = var.resource_group_name
  location = var.azure_region
  tags     = var.default_tag
}
