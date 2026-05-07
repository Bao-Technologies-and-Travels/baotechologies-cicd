output "prod_url" {
  value = "https://${var.prod_domain}"
}

output "instance_ip" {
  value = module.compute_staging.external_ip
}

output "dns_name_servers" {
  value = module.dns.name_servers
}
