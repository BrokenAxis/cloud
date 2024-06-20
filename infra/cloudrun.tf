resource "google_cloud_run_v2_service" "api-cloudrun" {
  project  = google_project.project.project_id
  location = var.region
  name     = "api-cloudrun"
  template {
    containers {
        image = "artifactregistry://${var.region}-maven.pkg.dev/${var.project_id}/${var.cloudrun_registry_id}/"
        ports {
            container_port = 8080
        }
    }
  }
  depends_on = [google_artifact_registry_repository.percent-surcharge-repository]
}