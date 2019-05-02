# Configure the Azure Provider
provider "azurerm" {
  version = "=1.27.1"
}

# Create a Resource Group
resource "azurerm_resource_group" "demo1_step2_rg" {
  name     = "${var.resource_group_name}"
  location = "${var.azure_region}"
  tags = "${var.default_tag}"
}
