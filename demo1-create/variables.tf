/**
* Global
**/
variable "azure_region" {
  description = "The Azure Region to be use"
  type        = string
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "the resource group name"
  type        = string
  default     = "terraform-iac-demo1"
}

variable "environment_tag" {
  description = "the current environement tag"
  type        = string
  default     = "production"
}

/**
* Network
**/
variable "vnet_range" {
  description = "The ip range for the VNET"
  type        = string
  default     = "10.0.0.0/16"
}

/**
* VM
**/
variable "ubuntu_version" {
  description = "The Ubuntu OS version to be used on VM"
  type        = string
  default     = "18.04-LTS"
}

variable "user_name" {
  description = "The username on the VM"
  type        = string
  default     = "azureuser"
}

variable "vm_size" {
  description = "The Vm Size"
  type        = string
  default     = "Standard_A1_v2"
}

variable "cloudinit_script_path" {
  description = "Path of the cloud-init script"
  type        = string
  default     = "vm-cloud-init.yaml"
}

