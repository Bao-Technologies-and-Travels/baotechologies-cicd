output "staging_url" {
  value = "https://staging.${var.prod_domain}"
}

output "staging_instance_ip" {
  value = module.compute_staging.external_ip
}

output "dns_name_servers" {
  value = module.dns.name_servers
}