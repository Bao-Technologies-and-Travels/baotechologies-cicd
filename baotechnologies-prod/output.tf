output "prod_url" {
  value = "https://${var.prod_domain}"
}

output "prod_instance_ip" {
  value = module.compute_prod.external_ip
}

output "dns_name_servers" {
  value = module.dns.name_servers
}
