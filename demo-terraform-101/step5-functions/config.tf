# Configure Terraform itself
terraform {
  # Specify minimum required Terraform version
  required_version = ">=0.12.0"
}

# Configure the Azure Provider
provider "azurerm" {
  version = "=1.44.0"
}
