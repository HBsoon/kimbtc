provider "google" {
  credentials = file("terraform-key.json")
  project     = var.project_id
  region      = var.region
}

# data "google_client_config" "default" {}

# data "google_container_cluster" "my_cluster" {
#   name     = google_container_cluster.cluster.name
#   location = var.location_1
#   project  = var.project_id
# }

# provider "kubernetes" {
#   config_path            = "~/.kube/config"
#   host                   = "https://${data.google_container_cluster.my_cluster.endpoint}"
#   token                  = data.google_client_config.default.access_token
#   cluster_ca_certificate = base64decode(data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate)
# }
