# ============================================================
# Cert-Manager Module Outputs
# ============================================================

output "namespace" {
  description = "Namespace where cert-manager is deployed"
  value       = var.enabled ? kubernetes_namespace.cert_manager[0].metadata[0].name : null
}

output "namespace_id" {
  description = "Kubernetes namespace UID"
  value       = var.enabled ? kubernetes_namespace.cert_manager[0].metadata[0].uid : null
}

output "helm_release_name" {
  description = "Name of the helm release"
  value       = var.enabled ? helm_release.cert_manager[0].name : null
}

output "helm_release_version" {
  description = "Version of the installed helm release"
  value       = var.enabled ? helm_release.cert_manager[0].version : null
}

output "crd_ready" {
  description = "True when cert-manager is enabled and its module has been applied"
  value       = var.enabled
}
