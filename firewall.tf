# gfe, healthcheck 범위 허용 방화벽 규칙 생성
resource "google_compute_firewall" "gfe_healthcheck_allow" {
  name    = "gfe-healthcheck-allow"
  network = google_compute_network.vpc.self_link

  priority  = 1000
  direction = "INGRESS"

  target_tags = ["gfe-healthcheck-allow"]

  source_ranges = [var.gfe_healthcheck_range]

  allow {
    protocol = "tcp"
    ports    = [var.web_port, var.was_port]
  }
}

# ssh 접속 범위 허용 방화벽 규칙 생성
resource "google_compute_firewall" "ssh_allow" {
  name    = "ssh-allow"
  network = google_compute_network.vpc.self_link

  priority  = 1000
  direction = "INGRESS"

  target_tags = ["ssh-allow"]

  source_ranges = [var.ssh_range]

  allow {
    protocol = "tcp"
    ports    = [var.ssh_port]
  }
}

# 내부 서브넷 범위 허용 방화벽 규칙 생성
resource "google_compute_firewall" "internal_subnet_allow" {
  name    = "internal-subnet-allow"
  network = google_compute_network.vpc.self_link

  priority  = 1000
  direction = "INGRESS"

  target_tags = ["internal-subnet-allow"]

  source_ranges = [var.internal_subnet_range]

  allow {
    protocol = "tcp"
    ports    = [var.was_port]
  }
}
