data "google_dns_managed_zone" "prod" {
  name    = "prod-zone"
  project = var.project
}

resource "google_dns_record_set" "prod" {
  name         = "${var.prod_domain}."
  type         = "A"
  ttl          = 300
  managed_zone = data.google_dns_managed_zone.prod.name
  rrdatas      = [var.prod_ip_address]
}
