# Datasources
Use datasources to retrieve existing resources and exploit there attributes in another deployment.

## Resources
- Documentation: 
  - Terraform >= 0.12: https://www.terraform.io/docs/configuration/data-sources.html
  - Terraform <= 0.11: https://www.terraform.io/docs/configuration-0-11/data-sources.html

## Goal
Understand :
- datasources

## Setup
If not done already, login to Azure:
```bash
az login
```

Initialize your workspace once:
```bash
cd deploy && terraform init && cd ..
cd retrieve && terraform init && cd ..
```

## Usage
Apply the first deployment, simulating existing resources:
```bash
cd deploy && terraform apply && cd ..
```

Then note the way data are used in the `retrieve/main.tf` resource configuration file
Use the existing resources for your second deployment:
```bash
cd retrieve && terraform apply && cd ..
```

## Teardown
Destroy resources when finished (in inverse order, to fulfill resources dependancies):
```bash
cd retrieve && terraform destroy && cd ..
cd deploy && terraform destroy && cd ..
```
