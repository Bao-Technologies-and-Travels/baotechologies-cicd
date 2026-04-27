resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public" {
  name          = "${var.vpc_name}-public"
  ip_cidr_range = var.subnet_cidr
  region        = var.region != null ? var.region : null
  network       = google_compute_network.vpc.self_link
}


resource "google_compute_firewall" "allow_web" {
  name    = "${var.vpc_name}-allow-web"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "8080", "3000", "3001"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "${var.vpc_name}-allow-ssh"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [var.subnet_cidr, "35.235.240.0/20"]
}


resource "google_compute_firewall" "allow_egress" {
  name    = "${var.vpc_name}-allow-egress"
  network = google_compute_network.vpc.name

  direction = "EGRESS"
  priority  = 1000

  allow {
    protocol = "all"
  }

  target_tags = ["allow-egress"]
}
