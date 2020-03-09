# Configure Terraform state backend
terraform {
  backend "local" {
    path = "tfstate/terraform.tfstate"
  }
}