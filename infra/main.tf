terraform {
  backend "gcs" {

  }
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "5.38.0"
    }
  }
}

provider "google-beta" {
  region = var.region

  user_project_override = true
}
