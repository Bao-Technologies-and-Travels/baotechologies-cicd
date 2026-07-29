output "staging_url" {
  value = "https://staging.${var.domain}"
}

output "instance_ip" {
  value = module.compute.external_ip
}

output "dns_name_servers" {
  value = module.dns.name_servers
}
