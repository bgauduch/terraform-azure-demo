# Functions
Use function to enhance your deployments.

## Resources
- Documentation:
  - Functions: https://www.terraform.io/docs/configuration/functions.html
  - Resources meta-parameters: https://www.terraform.io/docs/configuration/resources.html#meta-arguments

## Goal
Understand :
- HCL function in Terraform
- HCL resources meta-parameters

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
Note the meta-paramter and function usage on the Subnet resource in the `main.tf`configuration file.

Apply deployment:
```bash
terraform apply
```

## Teardown
Destroy resources when finished:
```bash
terraform destroy
```
