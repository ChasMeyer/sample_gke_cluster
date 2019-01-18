output "gke_primary_endpoint" {
  value = "${module.primary_cluster.endpoint}"
}

output "gke_primary_username" {
  sensitive = true,
  value = "${module.primary_cluster.username}"
}

output "gke_primary_password" {
  sensitive = true,
  value = "${module.primary_cluster.password}"
}

output "gke_primary_client_certificate" {
  sensitive = true,
  value = "${module.primary_cluster.client_certificate}"
}

output "gke_primary_client_key" {
  sensitive = true,
  value = "${module.primary_cluster.client_key}"
}

output "gke_primary_cluster_ca_certificate" {
  sensitive = true,
  value = "${module.primary_cluster.cluster_ca_certificate}"
}
