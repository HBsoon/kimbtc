variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "service_account" {
  type = string
}

variable "location_1" {
  type = string
}

variable "location_2" {
  type = string
}

variable "subenet_cidr" {
  type = string
}

variable "cluster_cidr" {
  type = string
}

variable "host_name" {
  type = string
}

variable "gfe_healthcheck_range" {
  type = string
}

variable "ssh_range" {
  type = string
}

variable "internal_subnet_range" {
  type = string
}

variable "web_port" {
  type = number
}

variable "was_port" {
  type = number
}

variable "ssh_port" {
  type = number
}

variable "dns" {
  type = string
}

variable "db_user" {
  type = string
}

variable "db_password" {
  type = string
}

variable "db_database" {
  type = string
}

variable "artifact_registry_id" {
  type = string
}

variable "web_image" {
  type = string
}

variable "was_image" {
  type = string
}

# variable "client_id" {
#   type = string
# }

# variable "client_secret" {
#   type = string
# }