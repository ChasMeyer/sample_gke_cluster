variable "project_id" {
  type = "string"
}
variable "cluster_min_version" {
  type = "string"
}

variable "devops_service_account_email" {
  type = "string"
}
variable "environments" {
  type = "list"
}

variable "primary_cluster_name" {
  type = "string"
}

variable "primary_additional_kube_zones" {
  type = "list"
}

variable "primary_default_kube_zone" {
  type = "string"
}

variable "default_node_pool_max_node_count" {
  type = "string"
}

variable "default_node_pool_min_node_count" {
  type = "string"
}
