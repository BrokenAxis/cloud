terraform {
  backend "gcs" {

  }
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.51.0"
    }
  }
}

provider "google-beta" {
  region = var.region

  user_project_override = true
}


