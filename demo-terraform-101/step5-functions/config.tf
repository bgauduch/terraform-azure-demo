# Configure Terraform itself
terraform {
  # Specify minimum required Terraform version
  required_version = ">=0.11.0"
}

# Configure the Azure Provider
provider "azurerm" {
  version = "=1.27.1"
}
