variable "domain" {
  type        = string
  description = "Root domain for the DNS zone (e.g. baotechnologies.com)."
}

variable "dns_zone_name" {
  type        = string
  description = "Name of the Cloud DNS managed zone."
}

variable "dns_project" {
  type        = string
  description = "GCP project that owns the DNS zone (production project)."
}

variable "staging_ip_address" {
  type        = string
  description = "Public IP of the staging compute instance."
}

variable "jenkins_ip_address" {
  type        = string
  description = "Public IP of the Jenkins server (staging instance)."
}

