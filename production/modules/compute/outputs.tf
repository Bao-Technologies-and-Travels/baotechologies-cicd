output "external_ip" {
  value = google_compute_instance.prod_instance.network_interface[0].access_config[0].nat_ip
}

output "private_ip" {
  value = google_compute_instance.prod_instance.network_interface[0].network_ip
}
