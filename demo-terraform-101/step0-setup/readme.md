# Base configuration
Anatomy of a minimal Terraform configuration using the Azure Resource Manager (AzureRM) provider.

## Resources
- Documentation:
  - conventions: https://www.terraform.io/docs/configuration/style.html
  - syntax: https://www.terraform.io/docs/configuration/syntax.html
  - Terraform configuration: https://www.terraform.io/docs/configuration/terraform.html
  - Providers: https://www.terraform.io/docs/configuration/providers.html
- Tutorial: https://learn.hashicorp.com/terraform/azure/configure_az#providers

## Goal
Understand:
- flat layout of a terraform project
- Terraform configuration
- provider notion (and the underlaying plugins based architecture)
- CLI base usage & workflow

## Setup
If not done already, login to Azure:
```bash
az login
```

Initialize your workspace once:
```bash
# Init cloud provider plugin & template plugin
terraform init
```

## Usage
Validate your configuration is working and you don't have any error:
```bash
# plan your deployment
terraform plan
# apply your deployment
terraform apply
```

## Teardown
Destroy resources when finished:
```bash
terraform destroy
```
