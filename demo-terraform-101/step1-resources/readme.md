# Resources
Create a simple resource (in this case a [Resource Group](https://docs.microsoft.com/azure/azure-resource-manager/resource-group-overview#resource-groups)) on Azure.
Here the Terraform and Provider configuration file is separated from the resources configuration file.

## Resources
- Documentation:
  - resources:
    - Terraform >= 0.12: https://www.terraform.io/docs/configuration/resources.html
    - Terraform <= 0.11: https://www.terraform.io/docs/configuration-0-11/resources.html
  - states: https://www.terraform.io/docs/state/index.html
- Tutorial: https://learn.hashicorp.com/terraform/azure/configure_az#resources

## Goal
Understand:
- resources configuration
- Terraform state management principles

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

## Usag
Validate your configuration:
```bash
terraform validate
```

Plan & apply deployment:
```bash
# Plan the terraform deployment
# This will compare the current state on Azure to the local (last known) terraform state
# It will details planned actions to converge to desired state (our configuration)
terraform plan
# Apply planned modifications
terraform apply
```

Check your Azure Portal to validate the Resource Group creation.

Visualize current Terraform state (last known "image" of your resources on Azure, from Terraform point of view):
```bash
terraform show
```

## Teardown
Destroy resources when finished:
```bash
terraform destroy
```
