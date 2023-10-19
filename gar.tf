resource "google_artifact_registry_repository" "repository" {
  provider = google

  location      = var.region
  repository_id = var.artifact_registry_id
  description   = "Docker repository"
  format        = "DOCKER"
}
