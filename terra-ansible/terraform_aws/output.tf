# You can define outputs here
output "eks_cluster_name" {
  description = "Name of the created EKS cluster"
  value       = module.eks_cluster.cluster_name
}

# You can define additional outputs here if needed
