resource "google_project_service" "firestore" {
  project = google_project.project.project_id
  service = "firestore.googleapis.com"

  depends_on = [google_project.project]
}

resource "google_firestore_database" "firestore" {
  project = google_project.project.project_id
  name    = "(default)"

  location_id = var.region
  type        = "FIRESTORE_NATIVE"

  depends_on = [google_project_service.firestore]
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