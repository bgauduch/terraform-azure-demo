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
Note the interpolation usage on the Virtual Network resource in the `main.tf` config file.

Apply deployment:
```bash
terraform apply
```

We use the `Dot` library from Graphviz, it should be installed and in your `$Path`.
Build the resource dependancy graph image:
```bash
# pipe the generated DOT file from graph command to library for image generation
terraform graph -type=plan | dot -Tpng > graph.png
```

This is a very simple exemple, but it can be usefull in more complex senarios.

## Teardown
Destroy resources when finished:
```bash
terraform destroy
```
