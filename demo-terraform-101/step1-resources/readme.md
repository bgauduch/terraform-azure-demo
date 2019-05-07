# Base
Create a simple resource (in this case a Resource Group) on Azure.

## Resources
- Documentation:
  - resources:
    - Terraform >= 0.12: https://www.terraform.io/docs/configuration/resources.html
    - Terraform <= 0.11: https://www.terraform.io/docs/configuration-0-11/resources.html
  - states: https://www.terraform.io/docs/state/index.html
- Tutorial: https://learn.hashicorp.com/terraform/azure/configure_az#resources

## Goal
Understand:
- resources creation
- Terraform state management principles

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

## Usag
Validate your configuration:
```bash
terraform validate
```

Plan & apply deployment (iterate if needed):
```bash
# Plan the terraform deployment
terraform plan
# Apply planned modifications
terraform apply
```

Check your Azure Portal to validate the Resource Group creation.

Visualize current tfstate:
```bash
terraform show
```

## Teardown
Destroy resources when finished:
```bash
terraform destroy
```
