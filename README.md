# BIG-IP Next for Kubernetes 2.3 — Step 1: cert-manager

## About This Workspace

Installs [cert-manager](https://cert-manager.io) into an existing IBM Cloud ROKS cluster. This is the first step in the BIG-IP Next for Kubernetes deployment sequence and must be applied before the FLO workspace.

## Deployment Sequence

```
Step 1 → cert-manager   (this workspace)
Step 2 → flo
Step 3 → cneinstance
Step 4 → license
```

## What This Workspace Deploys

- cert-manager Kubernetes namespace
- cert-manager Helm release (with `installCRDs=true`)
- Post-deployment delay to ensure `ClusterIssuer` and `Certificate` CRDs are fully registered before the FLO workspace runs

## Prerequisites

- An existing IBM Cloud ROKS (OpenShift) cluster
- IBM Cloud API key with sufficient IAM permissions

Get your cluster name or ID:
```bash
ibmcloud ks clusters --provider vpc-gen2
```

## Variables

| Variable | Description | Required | Default |
| -------- | ----------- | -------- | ------- |
| `ibmcloud_api_key` | IBM Cloud API Key | REQUIRED | |
| `ibmcloud_cluster_region` | IBM Cloud region where the cluster resides | REQUIRED with default | `ca-tor` |
| `ibmcloud_resource_group` | IBM Cloud Resource Group name (leave empty for account default) | Optional | `""` |
| `cluster_name_or_id` | Name or ID of the existing OpenShift ROKS cluster | REQUIRED | |
| `cert_manager_namespace` | Kubernetes namespace for cert-manager | Optional | `cert-manager` |
| `cert_manager_version` | cert-manager Helm chart version | Optional | `v1.17.3` |

## Outputs

| Output | Description |
| ------ | ----------- |
| `cert_manager_namespace` | Namespace where cert-manager is deployed |
| `cert_manager_version` | Installed cert-manager Helm chart version |

## Deployment

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

## Cleanup

```bash
terraform destroy -auto-approve
```

## Project Directory Structure

```
ibmcloud_schematics_bigip_next_for_kubernetes_2_3_cert_manager/
├── main.tf                   # Calls cert-manager module
├── variables.tf              # Input variables
├── outputs.tf                # Outputs
├── providers.tf              # IBM, kubernetes, helm providers
├── terraform.tfvars.example  # Example variable values
└── modules/
    └── cert-manager/
        ├── main.tf           # Namespace, Helm release, post-deploy wait
        ├── variables.tf
        └── outputs.tf
```
