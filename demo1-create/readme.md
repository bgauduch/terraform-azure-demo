# Demo 1
Create a VM with it's complete infrastructure stack using Azure cloud provider.

## Setup
Generate ssh keypair:
```bash
./tools/ssh-key-gen.sh
```

Login to azure:
```bash
az login
```

Initialize your workspace once:
```bash
# Init cloud provider plugin & template plugin
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