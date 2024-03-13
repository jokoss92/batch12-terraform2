resource "google_compute_network" "network_development" {
  name = "vpc-dev"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet_apps_dev" {
  name          = "subnet-apps"
  ip_cidr_range = "10.2.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.network_development.name
}

resource "google_compute_subnetwork" "subnet_db_dev" {
  name          = "subnet-db"
  ip_cidr_range = "10.3.0.0/24"
  region        = "us-central1"
  network       = google_compute_network.network_development.name
}