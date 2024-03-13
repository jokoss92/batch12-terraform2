terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.20.0"
    }
  }
}

provider "google" {
  project     = "cryptic-wonder-417007"
  region      = "us-central1"
  zone        = "us-central1-c"
  credentials = "/home/joko_ss_devsecops11/terraform-2/credentials.json"
}