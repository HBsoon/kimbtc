resource "google_sql_database_instance" "mysql" {
  name             = "mysql"
  database_version = "MYSQL_8_0"
  region           = var.region

  depends_on = [google_service_networking_connection.private_vpc_connection]

  settings {
    tier = "db-f1-micro" # 샌드박스 티어 (Enterprise)
    # availability_type = "REGIONAL"    # 여러 영역에 걸쳐 있는 고가용성
    activation_policy = "ALWAYS"
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.vpc.self_link
      require_ssl     = false
    }
  }

  deletion_protection = false # SQL 삭제 보호 비활성화
}

resource "google_sql_user" "db_user" {
  name     = var.db_user
  instance = google_sql_database_instance.mysql.name
  password = var.db_password
}

resource "google_sql_database" "db" {
  name     = var.db_database
  instance = google_sql_database_instance.mysql.name
}

