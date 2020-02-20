# Inputs variables
Working with variables as configuration inputs in a Terraform project.

## Resources
- Documentation:
  - Variables: https://www.terraform.io/docs/configuration/variables.html
- Tutorial: https://learn.hashicorp.com/terraform/azure/variables_az

## Goal
Understand :
- usage of variables
- default values
- config files & CLI arguments

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
Use variable default values
```bash
terraform apply
```

Edit the `variables.tf` file and remove a default value for the `resource_group_name`variable.
Execute the previous command again and observe the CLI prompt on the missing variable value.

Now use a command line arguments values for the Azure region:
```bash
terraform apply -var 'azure_region=North Europe'
```

You can also use a config file containing all variables values.
It allow you you to separate variables declarations from there values:
```bash
terraform apply -var-file="config.tfvars"
```

## Teardown
Destroy resources when finished:
```bash
terraform destroy -var-file="config.tfvars"
```
