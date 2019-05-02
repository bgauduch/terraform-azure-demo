# Variables
Working with variables in a Terraform project.

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
