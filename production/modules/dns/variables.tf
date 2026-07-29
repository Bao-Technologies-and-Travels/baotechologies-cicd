variable "domain" {
  type        = string
  description = "Root domain for production records (e.g. baotechnologies.com)."
}

variable "dns_zone_name" {
  type        = string
  description = "Name of the Cloud DNS managed zone."
}

variable "project" {
  type        = string
  description = "GCP project where the DNS zone is managed."
}

variable "app_ip_address" {
  type        = string
  description = "Public IP of the production compute instance."
}

variable "jenkins_ip_address" {
  type        = string
  description = "Public IP of the Jenkins server."
}
