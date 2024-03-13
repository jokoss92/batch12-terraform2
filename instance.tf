resource "google_compute_instance" "default" {
  name         = "apps-dev-02"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  tags = ["http-server", "development", "landingpage"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "development"
      }
    }
  }

  network_interface {
    network = google_compute_network.network_development.name
    subnetwork = google_compute_subnetwork.subnet_apps_dev.name

    access_config {
      // Ephemeral public IP
    }
  }
  metadata_startup_script = "apt update && apt install nginx -y"
}

resource "google_compute_instance" "db_dev" {
  name         = "db-dev-01"
  machine_type = "e2-small"
  zone         = "us-central1-b"
  allow_stopping_for_update = true

  tags = ["db-server", "development", "transaction"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      labels = {
        my_label = "development"
      }
    }
  }

  network_interface {
    network = google_compute_network.network_development.name
    subnetwork = google_compute_subnetwork.subnet_db_dev.name

    access_config {
      // Ephemeral public IP
    }
  }
  metadata_startup_script = "apt update && apt install postgresql -y"
}
