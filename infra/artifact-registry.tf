resource "google_artifact_registry_repository" "percent-surcharge-repository" {
  project  = google_project.project.project_id
  location = var.region

  repository_id = var.cloudrun_registry_id
  format        = "DOCKER"
}