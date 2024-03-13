output "private_ip_db" {
  value = google_compute_instance.db_dev.network_interface[*].network_ip
}

output "public_ip_db" {
  value = google_compute_instance.db_dev.network_interface[*].access_config[*].nat_ip
}

output "private_ip_apps" {
  value = google_compute_instance.default.network_interface[*].network_ip
}

output "public_ip_apps" {
  value = google_compute_instance.default.network_interface[*].access_config[*].nat_ip
}