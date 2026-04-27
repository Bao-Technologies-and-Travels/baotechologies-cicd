variable "project" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "network_self_link" {
  type = string
}

variable "subnet_self_link" {
  type = string
}

variable "service_account_email" {
  type = string
}

variable "disk_size" {
  type    = number
  default = 10
}

variable "zone" {
  type = string
}
