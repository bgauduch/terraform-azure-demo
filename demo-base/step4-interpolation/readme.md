# HCL Interpolation
"Hashicorp Configuration Language" interpolations / expressions usage and resources dependancies.

## Resources
- documentation:
  - interpolation (Terraform <= 0.11): https://www.terraform.io/docs/configuration-0-11/interpolation.html
  - expression (Terraform >= 0.12): https://www.terraform.io/docs/configuration/expressions.html#references-to-named-values
  - CLI graph: https://www.terraform.io/docs/commands/graph.html
- Tutorial: https://learn.hashicorp.com/terraform/azure/dependencies_az


## Goal
Understand :
- HCL interpolation
- resources dependancies & graph

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
Apply deployment:
```bash
terraform apply
```

Display the resource dependancy graph, You will need the `dot` binary:
```bash
terraform graph -type=plan| dot -Tpng > graph.png
```

## Teardown
Destroy resources when finished:
```bash
terraform destroy
```
