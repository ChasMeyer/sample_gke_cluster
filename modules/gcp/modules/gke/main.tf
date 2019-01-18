resource "google_container_cluster" "common_cluster" {
  lifecycle {
    //prevent_destroy = true
    ignore_changes = [
      "node_pool"
    ]
  }

  name    = "${var.cluster_name}"
  project = "${var.project_id}"
  zone    = "${var.default_kube_zone}"
  network = "projects/${var.project_id}/global/networks/${local.network}"

  min_master_version = "${var.cluster_min_version}"
  remove_default_node_pool = true

  additional_zones = "${var.additional_kube_zones}"
  network_policy {
    enabled = true
  }
  
  maintenance_policy {
    daily_maintenance_window {
      start_time = "10:00" // 6AM EST
    }
  }

  node_pool {
    name = "default-pool"
  }
}
resource "google_container_node_pool" "primary" {
  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      "name"
    ]
  }

  cluster = "${google_container_cluster.common_cluster.name}"
  zone = "${var.default_kube_zone}"
  name = "primary"
  initial_node_count = "${var.default_node_pool_min_node_count}"

  autoscaling {
    max_node_count = "${var.default_node_pool_max_node_count}"
    min_node_count = "${var.default_node_pool_min_node_count}"
  }

  management {
    auto_repair = true
    auto_upgrade = true
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append"
    ]

    machine_type = "n1-standard-4"
    image_type = "COS"
    disk_size_gb = "100"
  }
}