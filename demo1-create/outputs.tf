output "public_ip" {
  value = "${azurerm_public_ip.demo1_public_ip.ip_address}"
}

output "vnet_id" {
  value = "${azurerm_virtual_network.demo1_vnet.name}"
}

output "subnet_id" {
  value = "${azurerm_subnet.demo1_subnet.id}"
}
