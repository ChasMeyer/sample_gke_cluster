variable "project_id" {
  type = "string"
}
variable "cluster_name" {
  type = "string"
}
variable "default_kube_zone" {
  type = "string"
}
variable "additional_kube_zones" {
  type ="list"
}
variable "cluster_min_version" {
  type = "string"
}
variable "default_node_pool_max_node_count" {
  type = "string"
}
variable "default_node_pool_min_node_count" {
  type = "string"
}


