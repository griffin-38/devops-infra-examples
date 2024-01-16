
# AWS EKS Cluster
resource "aws_eks_cluster" "eks" {
  # Name of the EKS cluster
  name     = var.cluster_name

  # IAM role ARN for the EKS cluster
  role_arn = aws_iam_role.eks_cluster.arn

  # VPC configuration
  vpc_config {
    subnet_ids = var.subnets
  }
}

# IAM Role for EKS Cluster
resource "aws_iam_role" "eks_cluster" {
  # Name of the IAM role for the EKS cluster
  name = "eks-cluster"

  # Assume role policy for EKS service
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
  })
}

# Attach policy to IAM Role for EKS Cluster
resource "aws_iam_role_policy_attachment" "eks_cluster" {
  # ARN of the policy to attach
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

  # Name of the IAM role
  role       = aws_iam_role.eks_cluster.name
}

# Null Resource for running Ansible after EKS Cluster creation
resource "null_resource" "run_ansible" {
  provisioner "local-exec" {
    # Command to run Ansible playbook with the generated kubeconfig
    command     = "ansible-playbook -i '${module.eks_cluster.cluster_name}_kubeconfig_inventory' eks-setup.yml"
    
    # Working directory for the command
    working_dir = "${path.module}/ansible"
  }

  # Depends on the EKS Cluster creation
  depends_on = [aws_eks_cluster.eks]
}
