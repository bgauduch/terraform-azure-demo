# Demo 2
Add a VM to an existing resource group with an existing network stack.

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

You need resources from demo1, so follow [demo1 setup](/demo1-create).

## Usage
Plan & apply deployment (iterate if needed):
```bash
# Plan the terraform deployment
terraform plan
# Apply planned modifications
terraform apply
```

## Teardown
Destroy resources when finished:
```bash
terraform destroy
```