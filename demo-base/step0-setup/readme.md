# Base
Anatomy of a minimal Terraform configuration using the Azure Resource Manager (AzureRM) provider.

## Resources
- Documentation:
  - Terraform >= 0.12:
    - conventions: https://www.terraform.io/docs/configuration/style.html
    - syntax: https://www.terraform.io/docs/configuration/syntax.html
    - Terraform configuration: https://www.terraform.io/docs/configuration/terraform.html
    - Providers: https://www.terraform.io/docs/configuration/providers.html
  - Terraform <= 0.11:
    - syntax: https://www.terraform.io/docs/configuration-0-11/syntax.html
    - providers: https://www.terraform.io/docs/configuration-0-11/providers.html
    - Terraform configuration: https://www.terraform.io/docs/configuration-0-11/terraform.html
- Demo

## Goal
Understand:
- core layout of a terraform project
- Terraform configuration
- provider notion (and the underlaying plugins based architecture)
- CLI base usage & workflow

## Setup
Login to Azure:
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
