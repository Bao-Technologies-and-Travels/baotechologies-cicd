data "google_dns_managed_zone" "main" {
  name    = var.dns_zone_name
  project = var.dns_project
}

resource "google_dns_record_set" "jenkins" {
  name         = "jenkins.staging.${var.domain}."
  type         = "A"
  ttl          = 300
  project      = var.dns_project
  managed_zone = data.google_dns_managed_zone.main.name
  rrdatas      = [var.jenkins_ip_address]
}

resource "google_dns_record_set" "staging" {
  name         = "staging.${var.domain}."
  type         = "A"
  ttl          = 300
  project      = var.dns_project
  managed_zone = data.google_dns_managed_zone.main.name
  rrdatas      = [var.staging_ip_address]
}

resource "google_dns_record_set" "www_staging" {
  name         = "www.staging.${var.domain}."
  type         = "CNAME"
  ttl          = 300
  project      = var.dns_project
  managed_zone = data.google_dns_managed_zone.main.name
  rrdatas      = ["staging.${var.domain}."]
}
