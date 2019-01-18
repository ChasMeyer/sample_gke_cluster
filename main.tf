terraform {
  backend "gcs" {
    prefix  = "terraform/gke_state"
  }
}

resource "google_project_service" "gke-api" {
  project = "${var.gcp_project_id}"
  service = "container.googleapis.com"
}

provider "google" {
  version = "1.18"
  project = "${var.gcp_project_id}"
  region  = "${var.gcp_region}"
}

provider "kubernetes" {
  version = "1.2"
  alias="kubernetes-primary"
  host = "${module.gcp.gke_primary_endpoint}"
  username = "${module.gcp.gke_primary_username}"
  password = "${module.gcp.gke_primary_password}"
  client_certificate = "${base64decode(module.gcp.gke_primary_client_certificate)}"
  client_key = "${base64decode(module.gcp.gke_primary_client_key)}"
  cluster_ca_certificate = "${base64decode(module.gcp.gke_primary_cluster_ca_certificate)}"
}

provider "null" {
  version = "1.0"
}

provider "random" {
  version = "1.3"
}

module "gcp" {
  source = "./modules/gcp"
  project_id = "${var.gcp_project_id}"
  primary_cluster_name = "${var.primary_cluster_name}"
  cluster_min_version = "${var.cluster_min_version}"
  environments = "${var.environments}"
  default_node_pool_max_node_count = "${var.default_node_pool_max_node_count}"
  default_node_pool_min_node_count = "${var.default_node_pool_min_node_count}"
  devops_service_account_email = "${var.devops_service_account_email}"
  primary_default_kube_zone = "${var.primary_default_kube_zone}"
  primary_additional_kube_zones = "${var.primary_additional_kube_zones}"
  
}

module "kubernetes-primary" {
  source = "./modules/kubernetes"
  providers = {
    kubernetes = "kubernetes.kubernetes-primary"
  }
  namespaces = ["${var.namespaces}"]
}
