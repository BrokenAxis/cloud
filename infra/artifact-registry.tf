resource "google_artifact_registry_repository" "repository" {
  project  = google_project.project.project_id
  location = var.region

  repository_id = "cloudrun-registry"
  format        = "DOCKER"
}