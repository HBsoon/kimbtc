# 커스텀 VPC 생성
resource "google_compute_network" "vpc" {
  name                    = "vpc"
  auto_create_subnetworks = false # 자동으로 서브넷을 생성하지 않도록 설정
}

# 서브넷 생성
resource "google_compute_subnetwork" "subnet" {
  name                     = "subnet"
  region                   = var.region
  network                  = google_compute_network.vpc.self_link # 커스텀 VPC를 참조
  ip_cidr_range            = var.subenet_cidr
  private_ip_google_access = true # 비공개 액세스를 활성화
}

# VPC 피어링 ip 범위 할당
resource "google_compute_global_address" "private_ip_address" {
  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 20
  network       = google_compute_network.vpc.self_link
}

# VPC 피어링 연결
resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.vpc.self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}