resource "google_project" "default" {
  name       = var.project_id
  project_id = var.project_id
}

resource "google_project_service" "default" {
  project = google_project.default.project_id
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