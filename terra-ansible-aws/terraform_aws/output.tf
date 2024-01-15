# You can define outputs here
output "eks_cluster_name" {
  description = "Name of the created EKS cluster"
  value       = module.eks_cluster.cluster_name
}

output "eks_cluster_endpoint" {
  description = "Endpoint for the EKS cluster"
  value       = module.eks_cluster.cluster_endpoint
}

output "eks_cluster_certificate_authority_data" {
  description = "Certificate Authority data for the EKS cluster"
  value       = module.eks_cluster.cluster_certificate_authority_data
}

# You can define additional outputs here if needed

