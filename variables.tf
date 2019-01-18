variable "gcp_project_id" {
  type        = "string"
  description = "GCP project ID"
}
variable "gcp_region" {
  type        = "string"
  description = "Region in which to place infrastructure"
}
variable "primary_cluster_name" {
  type        = "string"
  description = "Name of primary k8s cluster"
}
variable "cluster_min_version" {
  type        = "string"
  description = "Minimum k8s version for cluster"
}
variable "default_node_pool_max_node_count" {
  type        = "string"
  description = "Default node pool max count"
}

variable "default_node_pool_min_node_count" {
  type        = "string"
  description = "Default node pool minimum count"
}

variable "devops_service_account_email" {
  type        = "string"
  description = "Email address of service account for DevOps team"
}
variable "environments" {
  type        = "list"
}
variable "namespaces" {
  type        = "list"
}
variable "primary_default_kube_zone" {
  type= "string"
}
variable "primary_additional_kube_zones" {
  type="list"
}