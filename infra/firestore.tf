resource "google_firestore_database" "firestore" {
  provider = google-beta
  project = google_project.project.project_id
  name    = "(default)"

  location_id = var.region
  type        = "FIRESTORE_NATIVE"

  depends_on = [google_project_service.project]
}

resource "google_firebase_project" "project" {
  provider = google-beta
  project  = google_project.project.project_id

  depends_on = [
    google_project_service.project
  ]
}

resource "google_firebase_android_app" "project" {
  provider = google-beta

  project      = google_project.project.project_id
  display_name = "Surcharge"
  package_name = "com.surcharge"

#   sha1_hashes = [""]
#   sha256_hashes = [""]

  depends_on = [
    google_firebase_project.project,
  ]
}