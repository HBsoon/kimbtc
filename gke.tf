resource "google_container_cluster" "cluster" {
  name               = "cluster"
  location           = var.region
  initial_node_count = 1

  node_locations = [var.location_2]

  # Enable Autopilot mode
  enable_autopilot = true
  
  #삭제 방지 해제
  deletion_protection = false

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = var.cluster_cidr
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "/16"
    services_ipv4_cidr_block = "/16"
  }
}
