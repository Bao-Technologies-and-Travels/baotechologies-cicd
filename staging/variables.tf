variable "project" {
  type = string
}

variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "subnet_cidr" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "instance_type" {
  type = string
}

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
