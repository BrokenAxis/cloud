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

resource "google_firestore_document" "document" {
  project     = google_project.project.project_id
  database    = google_firestore_database.firestore.name
  collection  = "users"
  document_id = "profile"

  fields = {
    name = {
      string_value = ""
    }
    email = {
      string_value = ""
    }
  }
}
