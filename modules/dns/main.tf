resource "google_dns_managed_zone" "prod" {
  name        = "prod-zone"
  dns_name    = "${var.prod_domain}."
  description = "Public DNS zone for ${var.prod_domain}"
  project     = var.project
}

resource "google_dns_record_set" "jenkins" {
  name         = "jenkins.${var.prod_domain}."
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.prod.name
  rrdatas      = [var.jenkins_ip_address]
}

resource "google_dns_record_set" "caa" {
  name         = "${var.prod_domain}."
  type         = "CAA"
  ttl          = 300
  managed_zone = google_dns_managed_zone.prod.name
  rrdatas = [
    "0 issue \"letsencrypt.org\"",
  ]
}

resource "google_dns_record_set" "www_prod" {
  name         = "www.${var.prod_domain}."
  type         = "CNAME"
  ttl          = 300
  managed_zone = google_dns_managed_zone.prod.name
  rrdatas      = ["${var.prod_domain}."]
}

resource "google_dns_record_set" "resend_dkim" {
  name         = "resend._domainkey.${var.prod_domain}."
  type         = "TXT"
  ttl          = 300
  managed_zone = google_dns_managed_zone.prod.name
  rrdatas      = ["p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDWeuliiBsd1xWwx80h6Jy6MvEd8Ou4SGyhdc/RDlfL0T7OSEuCuol61qYqVGMrr7ARe42SoIABRMPr0DwZScIjC6U1Sg+a6MfrOdZkMxnID2KGqknvJryBdsHirv4T0qNqLoN/JTkemiLp/1UEfOH7GEL+LfDdrDh4N/oFaas87wIDAQAB"]
}

resource "google_dns_record_set" "resend_mx" {
  name         = "send.${var.prod_domain}."
  type         = "MX"
  ttl          = 300
  managed_zone = google_dns_managed_zone.prod.name
  rrdatas      = ["10 feedback-smtp.us-east-1.amazonses.com."]
}

resource "google_dns_record_set" "resend_txt" {
  name         = "send.${var.prod_domain}."
  type         = "TXT"
  ttl          = 300
  managed_zone = google_dns_managed_zone.prod.name
  rrdatas      = ["v=spf1 include:amazonses.com ~all"]
}

resource "google_dns_record_set" "resend_dmarc" {
  name         = "_dmarc.${var.prod_domain}."
  type         = "TXT"
  ttl          = 300
  managed_zone = google_dns_managed_zone.prod.name
  rrdatas      = ["v=DMARC1; p=none;"]
}
