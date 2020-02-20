/**
* Global
**/

variable "env" {
  description = "The environnement tag"
  type        = string
}

variable "resource_group_name" {
  description = "the resource group name"
  type        = string
  default     = "terraform-iac-demo3"
}

variable "azure_region" {
  description = "The Azure Region to be use"
  type        = string
  default     = "West Europe"
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

