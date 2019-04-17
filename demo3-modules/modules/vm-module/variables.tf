/**
* Global
**/
variable "env" {
  description = "The environnement tag"
  type        = "string"
}

variable "resource_group_name" {
  description = "the resource group name"
  type        = "string"
}

variable "location" {
  description = "the location of the resource group"
  type        = "string"
}

/**
* Network
**/

variable "subnet_id" {
  description = "the subnet id to be use for the vm deployment"
  type        = "string"
}
variable "public_ip_fqdn_prefix" {
  description = "the fqdn prefix for the public IP"
  type        = "string"
}

/**
* VM
**/
variable "ubuntu_version" {
  description = "The Ubuntu OS version to be used on VM"
  type        = "string"
}

variable "user_name" {
  description = "The username on the VM"
  type        = "string"
  default     = "azureuser"
}

variable "vm_size" {
  description = "The Vm Size"
  type        = "string"
}

variable "ssh_key_private_path" {
  description = "The path to the SSH private key"
  type        = "string"
}

variable "ssh_key_public_path" {
  description = "The path to the SSH public key"
  type        = "string"
}
