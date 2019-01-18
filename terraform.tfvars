gcp_project_id = "sample-gke-for-ea"
gcp_region = "us-central1"

primary_cluster_name = "king-kube"

primary_default_kube_zone="us-central1-a"

primary_additional_kube_zones=[
  "us-central1-b",
  "us-central1-c",
]


cluster_min_version = "1.11.6-gke.2"
default_node_pool_max_node_count = 3 // per zone
default_node_pool_min_node_count = 1 // per zone

environments = [
  "dev",
  "qa",
  "stage",
  "prod"
]

namespaces = [
  "dev-namespace1",
  "qa-namespace1",
  "stage-namespace1",
  "prod-namespace1",
  
  "dev-namespace2",
  "qa-namespace2",
  "stage-namespace2",
  "prod-namespace2"
]
