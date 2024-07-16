resource "google_project" "project" {
  name       = var.project_id
  project_id = var.project_id

  labels = {
    "firebase" = "enabled"
  }
}

resource "google_project_service" "project" {
  project = google_project.project.project_id
  for_each = toset([
    "artifactregistry.googleapis.com",
    "firestore.googleapis.com",

    "cloudresourcemanager.googleapis.com",
    "cloudbilling.googleapis.com",
    "serviceusage.googleapis.com",
  ])

  service = each.key

  depends_on = [google_project.project]
}