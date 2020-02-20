output "public_ip_address" {
  value = module.vm_module.public_ip_address
}

output "public_ip_fqdn" {
  value = "$${module.vm_module.public_ip_fqdn}"
}

