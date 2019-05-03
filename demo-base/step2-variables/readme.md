# Variables
Working with variables in a Terraform project.

## Resources
- Documentation:
  - Terraform >= 0.12: https://www.terraform.io/docs/configuration/variables.html
  - Terraform <= 0.11: https://www.terraform.io/docs/configuration-0-11/variables.html
- Tutorial: https://learn.hashicorp.com/terraform/azure/variables_az

## Goal
Understand :
- usage of variables
- default values
- config files & CLI arguments

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
Use variable default values & CLI prompt on missing value:
```bash
terraform apply
```

Use command line arguments values:
```bash
terraform apply -var 'azure_region=North Europe'
```

Use a config file:
```bash
terraform apply -var-file="config.tfvars"
```

## Teardown
Destroy resources when finished:
```bash
terraform destroy
```
