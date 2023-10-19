# resource "kubernetes_deployment" "was_tomcat" {
#   metadata {
#     name      = "was-tomcat"
#     namespace = "default"
#   }

#   depends_on = [google_container_cluster.cluster]

#   spec {
#     replicas = 2

#     selector {
#       match_labels = {
#         app = "was-tomcat"
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           app = "was-tomcat"
#         }
#       }

#       spec {
#         container {
#           image = var.was_image
#           name  = "was-tomcat-container"

#           port {
#             container_port = 8080
#           }
#         }
#       }
#     }
#   }
# }

# resource "kubernetes_service" "was_tomcat_service" {
#   metadata {
#     name = "was-tomcat-service"
#     labels = {
#       app = "was-tomcat"
#     }
#   }

#   depends_on = [google_container_cluster.cluster, kubernetes_deployment.was_tomcat]

#   spec {
#     selector = {
#       app = "was-tomcat"
#     }

#     type = "NodePort"

#     port {
#       target_port = 8080
#       port        = 8080
#     }
#   }
# }
