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
variable "vnet_range" {
  description = "The ip range for the VNET"
  type        = "string"
}
