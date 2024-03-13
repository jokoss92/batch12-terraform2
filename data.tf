data "google_compute_network" "vpc_default" {
  name = "default"
}

resource "google_compute_subnetwork" "subnet_testing" {
    name = "subnet-testing"
    ip_cidr_range = "192.168.1.0/24"
    network = data.google_compute_network.vpc_default.name
}