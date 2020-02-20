# Configure Terraform itself
terraform {
  # Specify minimum required Terraform version
  required_version = ">=0.12.0"
}

# Configure the Azure Provider
provider "azurerm" {
  # Here we have fixed the provider version
  # see https://releases.hashicorp.com./terraform-provider-azurerm/ for available releases versions.
  version = "=1.44.0"
}
