/**
* Global
**/
variable "resource_group_name" {
  description = "the resource group name"
  type        = "string"
  default     = "terraform-iac"
}

/**
* Network
**/
variable "vnet_name" {
  description = "The existing VNET name"
  type        = "string"
  default     = "demo1_vnet"
}

variable "subnet_name" {
  description = "The existing Subnet name"
  type        = "string"
  default     = "demo1_subnet"
}

/**
* VM
**/
variable "ubuntu_version" {
  description = "The Ubuntu OS version to be used on VM"
  type        = "string"
  default     = "18.04-LTS"
}

variable "user_name" {
  description = "The username on the VM"
  type        = "string"
  default     = "azureuser"
}

variable "vm_size" {
  description = "The Vm Size"
  type        = "string"
  default     = "Standard_A1_v2"
}
