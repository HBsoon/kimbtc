# # DNS 영역 생성
# resource "google_dns_managed_zone" "dns" {
#   name     = "dns"
#   dns_name = var.dns
# }

# resource "google_dns_record_set" "www_jundol_shop" {
#   name    = "www.jundol.shop." 
#   type    = "A"
#   ttl     = 300  
#   managed_zone = google_dns_managed_zone.dns.name

#   rrdatas = [
#     "34.160.232.235"
#   ]
# }
