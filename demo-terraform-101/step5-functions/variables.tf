# Setup parameter for the number of subnet
variable "subnet_number" {
  type="string"
  description="The number of subnet to create inside the vNET"
  default = 2
}