# Terraform on Azure 101
Understand the core concepts of Terraform applied to Azure Cloud using simple examples.

## Disclaimer
Existing demos are written toward Terraform >= 0.12.

## [OPTIONAL] Setup a shared plugins cache directory
As each demo is a standalone Terraform module, a good practices would be to use a shared plugins cache between them to speed up `terraform init` command and reduce bandwidth usage as per [the documentation](https://www.terraform.io/docs/configuration/providers.html#provider-plugin-cache).

Simply run the following command in your shell once adapted to your current OS :
```sh
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"
```

## Usage
Follow each subfolders in order to discover Terraform concepts in a somewhat progressive order :
- [Step 0](/demo-terraform-101/step0-setup): discover the base configuration
- [Step 1](/demo-terraform-101/step1-resources): configure and deploy your first resource
- [Step 2](/demo-terraform-101/step2-inputs): how to pass parameters to your configuration
- [Step 3](/demo-terraform-101/step3-outputs): exports resources parameters values once created
- [Step 4](/demo-terraform-101/step4-interpolation): use resources parameters to populate other resources parameters
- [Step 5](/demo-terraform-101/step5-functions): use Terraform build-in functions
- [Step 6](/demo-terraform-101/step6-datasources): retrieve configuration parameters from existing cloud resources 

## Going further
Obviously not everything is detailled here, diving into the official documentation is highly recommended to discover other topics (provisioning, local values, overrides, etc).
