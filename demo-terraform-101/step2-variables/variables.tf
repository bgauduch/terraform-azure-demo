variable "azure_region" {
  description = "The Azure Region to use"
  type        = "string"
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "the resource group name"
  type        = "string"
}

variable "default_tag" {
  description = "the current environement tag"
  type        = "map"
  default = {
    "environment" = "production"
  }
}