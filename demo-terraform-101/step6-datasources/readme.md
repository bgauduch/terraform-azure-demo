# Functions
Use datasources to retrieve existing resources and used there attributes in another deployment.

## Resources
- Documentation: 
  - Terraform >= 0.12: https://www.terraform.io/docs/configuration/data-sources.html
  - Terraform <= 0.11: https://www.terraform.io/docs/configuration-0-11/data-sources.html

## Goal
Understand :
- datasources

## Setup
Login to Azure:
```bash
az login
```

Initialize your workspace once:
```bash
cd deploy && terraform init && cd ..
cd retrieve && terraform init && cd ..
```

## Usage
Deploy your project first :
```bash
cd deploy && terraform apply && cd ..
```

Then, use the existing resources for your second project:
```bash
```

## Teardown
Destroy resources when finished:
```bash
cd deploy && terraform destroy && cd ..
cd retrieve && terraform destroy && cd ..
```
