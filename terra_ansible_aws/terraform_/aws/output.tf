# This file will allow you to capture and use various pieces of information about your EKS cluster after it has been provisioned.
output "public_ip" {
  value = module.ec2.aws_instance.aws_instance.public_ip
}

output "instance" {
  value = module.ec2.aws_instance.launch_instance.instance_type
}

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

