resource "google_compute_firewall" "dev_firewall" {
  name    = "dev-firewall"
  network = google_compute_network.network_development.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "22", "5432"]
  }
  
  source_ranges = [ "0.0.0.0/0" ]
  target_tags = ["development", "http-server"]
}
