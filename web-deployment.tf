# resource "kubernetes_deployment" "web_apache" {
#   metadata {
#     name      = "web-apache"
#     namespace = "default"
#   }

#   depends_on = [google_container_cluster.cluster]

#   spec {
#     replicas = 2

#     selector {
#       match_labels = {
#         app = "web-apache"
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           app = "web-apache"
#         }
#       }

#       spec {
#         container {
#           image = var.web_image
#           name  = "web-apache-container"

#           port {
#             container_port = 80
#           }

#           # livenessProbe 설정
#           liveness_probe {
#             http_get {
#               path   = "/petclinic" # Health Check 경로를 설정하세요.
#               port   = 80
#               scheme = "HTTP"
#             }
#             initial_delay_seconds = 30
#             period_seconds        = 10
#           }

#           # readinessProbe 설정
#           readiness_probe {
#             http_get {
#               path   = "/petclinic" # Health Check 경로를 설정하세요.
#               port   = 80
#               scheme = "HTTP"
#             }
#             initial_delay_seconds = 5
#             period_seconds        = 5
#           }
#         }
#       }
#     }
#   }
# }

# resource "kubernetes_service" "web_apache_service" {
#   metadata {
#     name = "web-apache-service"
#     labels = {
#       app = "web-apache"
#     }
#   }

#   depends_on = [google_container_cluster.cluster, kubernetes_deployment.web_apache]

#   spec {
#     selector = {
#       app = "web-apache"
#     }

#     type = "NodePort"

#     port {
#       target_port = 80
#       port        = 80
#     }
#   }
# }
