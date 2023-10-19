resource "google_container_cluster" "cluster" {
  name     = "cluster"
  location = var.location_1

  release_channel {
    channel = "REGULAR"
  }
}
