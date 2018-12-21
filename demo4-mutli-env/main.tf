/*
* Resource Group
*/
resource "azurerm_resource_group" "demo4_rg" {
  name     = "${var.resource_group_name}-${var.env}"
  location = "${var.azure_region}"

  tags {
    environment = "${var.env}"
  }
}

/*
* Call network module
*/
module "network_module" {
  source = "./modules/network-module"

  env                 = "${var.env}"
  resource_group_name = "${azurerm_resource_group.demo4_rg.name}"
  location            = "${azurerm_resource_group.demo4_rg.location}"
  vnet_range          = "${var.vnet_range}"
}

/*
* Call VM module
*/
module "vm_module" {
  source = "./modules/vm-module"

  env                  = "${var.env}"
  resource_group_name  = "${azurerm_resource_group.demo4_rg.name}"
  location             = "${azurerm_resource_group.demo4_rg.location}"
  subnet_id            = "${module.network_module.subnet_id}"
  ubuntu_version       = "${var.ubuntu_version}"
  user_name            = "${var.user_name}"
  vm_size              = "${var.vm_size}"
  ssh_key_private_path = "${file("${path.module}/ssh/azure-vm-rsa")}"
  ssh_key_public_path  = "${file("${path.module}/ssh/azure-vm-rsa.pub")}"
}
