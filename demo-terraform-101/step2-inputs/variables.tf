
# Create variables and assign default values
variable "azure_region" {
  description = "The Azure Region to use"
  type        = string
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "the resource group name"
  type        = string
  # The following line has been intentionnaly commented out.
  # It show you the Terraform CLI prompt in case of missing variable value.
  # default     = "demo_step2_rg"
}

variable "default_tag" {
  description = "the current environement tag"
  type        = map
  default = {
    environment = "production"
  }
}