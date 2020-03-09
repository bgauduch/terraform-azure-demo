# Demo 3
Use modules to deploy your resources.
In fact, you have been using modules since the bigning : the `root module`, base of any terraform configuration.

## Resources
Documentation:
- Terraform >= 0.12: https://www.terraform.io/docs/configuration/modules.html
- Terraform <= 0.22: https://www.terraform.io/docs/configuration-0-11/modules.html


## Setup
Generate ssh keypair:
```bash
./tools/ssh-key-gen.sh
```

If not done already, login to azure:
```bash
az login
```

Initialize your workspace once:
```bash
# init cloud provider plugin & template plugin
terraform init
```

Plan & apply deployment (iterate if needed):
```bash
# Plan the terraform deployment
terraform plan
# Apply planned modifications
terraform apply
```

Destroy resources when finished:
```bash
terraform destroy
```