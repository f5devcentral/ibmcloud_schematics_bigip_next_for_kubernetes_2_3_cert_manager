output "cert_manager_namespace" {
  description = "Namespace where cert-manager is deployed"
  value       = module.cert_manager.namespace
}

output "cert_manager_version" {
  description = "Installed cert-manager Helm chart version"
  value       = module.cert_manager.helm_release_version
}
