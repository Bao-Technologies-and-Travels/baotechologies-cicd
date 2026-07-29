output "name_servers" {
  value = data.google_dns_managed_zone.main.name_servers
}

output "zone_name" {
  value = data.google_dns_managed_zone.main.name
}
