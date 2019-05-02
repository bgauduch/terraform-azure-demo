# Base
Minimal Terraform configuration to create a Resource Group on Azure using the Azure Resource Manager provider.

Here we have pinned the provider version, see [here](https://releases.hashicorp.com./terraform-provider-azurerm/) for available releases versions.

## Goal
Understand:
- core layout of a terraform project
- provider notion (and the underlaying plugins based architecture)
- resource notion
- CLI base usage
- state management principles

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
Plan & apply deployment (iterate if needed):
```bash
# Plan the terraform deployment
terraform plan
# Apply planned modifications
terraform apply
```

Visualize current tfstate:
```bash
terraform show
```

## Teardown
Destroy resources when finished:
```bash
terraform destroy
```
