### Show public IP address once task is completed
output "public_ip_address" {
  value = azurerm_public_ip.demo1_public_ip.ip_address
}

### Display public IP FQDN
output "public_ip_fqdn" {
  value = azurerm_public_ip.demo1_public_ip.fqdn
}

