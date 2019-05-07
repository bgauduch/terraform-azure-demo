# Configure Terraform itself
terraform {
  required_version = ">=0.11.0"
}

# Configure the Azure Provider
provider "azurerm" {
  version = "=1.27.1"
}

# Create a Resource Group
resource "azurerm_resource_group" "demo_step1_rg" {
  name     = "demo_step1_rg"
  location = "West Europe"

  tags {
    environment = "production"
  }
}
