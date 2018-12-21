output "public_ip" {
  value = "${azurerm_public_ip.demo2_public_ip.ip_address}"
}
