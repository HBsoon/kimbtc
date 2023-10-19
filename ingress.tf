# resource "kubernetes_manifest" "ingress" {
#   manifest = yamldecode(<<-EOT
# apiVersion: networking.k8s.io/v1
# kind: Ingress
# metadata:
#   name: ingress-service
#   namespace: default
# spec:
#   defaultBackend:
#     service:
#       name: web-apache-service
#       port:
#         number: 80
# EOT
#   )

# depends_on = [kubernetes_deployment.web_apache]
# }
