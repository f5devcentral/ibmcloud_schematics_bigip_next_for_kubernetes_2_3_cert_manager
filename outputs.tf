# ============================================================
# Root Terraform Outputs
# F5 BNK Orchestrator for existing ROKS cluster
# ============================================================

# ============================================================
# Cluster Info (from data source lookup)
# ============================================================

output "cluster_id" {
  description = "ID of the target OpenShift cluster"
  value       = data.ibm_container_vpc_cluster.cluster.id
}

output "cluster_name" {
  description = "Name of the target OpenShift cluster"
  value       = data.ibm_container_vpc_cluster.cluster.name
}

output "cluster_crn" {
  description = "CRN of the target OpenShift cluster"
  value       = data.ibm_container_vpc_cluster.cluster.crn
}

# ============================================================
# cert-manager Outputs
# ============================================================

output "cert_manager_namespace" {
  description = "Namespace where cert-manager is deployed"
  value       = module.cert_manager.namespace
}

output "cert_manager_version" {
  description = "Installed cert-manager Helm chart version"
  value       = module.cert_manager.helm_release_version
}
