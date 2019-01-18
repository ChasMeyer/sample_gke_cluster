output "endpoint" {
  value = "${google_container_cluster.common_cluster.endpoint}"
}

output username {
  sensitive = true,
  value = "${google_container_cluster.common_cluster.master_auth.0.username}"
}

output password {
  sensitive = true,
  value = "${google_container_cluster.common_cluster.master_auth.0.password}"
}

output client_certificate {
  sensitive = true,
  value = "${google_container_cluster.common_cluster.master_auth.0.client_certificate}"
}

output client_key {
  sensitive = true,
  value = "${google_container_cluster.common_cluster.master_auth.0.client_key}"
}

output cluster_ca_certificate {
  sensitive = true,
  value = "${google_container_cluster.common_cluster.master_auth.0.cluster_ca_certificate}"
}
