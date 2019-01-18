module "primary_cluster" {
  source = "./modules/gke"
  cluster_name="${var.primary_cluster_name}"
  project_id="${var.project_id}"
  default_kube_zone="${var.primary_default_kube_zone}"
  additional_kube_zones="${var.primary_additional_kube_zones}"
  cluster_min_version="${var.cluster_min_version}"
  default_node_pool_max_node_count = "${var.default_node_pool_max_node_count}"
  default_node_pool_min_node_count = "${var.default_node_pool_min_node_count}"
}
