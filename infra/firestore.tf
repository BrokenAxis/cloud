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
