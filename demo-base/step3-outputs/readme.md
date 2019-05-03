# Using variables
Expose created resources.

## Resources
- Documentation:
  - Terraform >= 0.12: https://www.terraform.io/docs/configuration/outputs.html
  - Terraform <= 0.11: https://www.terraform.io/docs/configuration-0-11/outputs.html
- Demo: https://learn.hashicorp.com/terraform/getting-started/outputs

## Goal
Understand :
- usage of output

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
Apply deployment (ouputs will be displayed at the end):
```bash
terraform apply
```

Display outputs values after deployment:
```bash
terraform output
```

## Teardown
Destroy resources when finished:
```bash
terraform destroy
```
