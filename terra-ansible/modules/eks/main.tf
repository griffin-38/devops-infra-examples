variable "cluster_name" {
  description = "Name for the EKS cluster"
}

variable "subnets" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where the EKS cluster will be deployed"
}

provider "aws" {
  region = "us-west-2"  # Set your desired AWS region
}

resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids = var.subnets
  }
}

resource "aws_iam_role" "eks_cluster" {
  name = "eks-cluster"

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

resource "aws_iam_role_policy_attachment" "eks_cluster" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster.name
}

resource "null_resource" "run_ansible" {
  provisioner "local-exec" {
    command     = "ansible-playbook -i '${module.eks_cluster.cluster_name}_kubeconfig_inventory' eks-setup.yml"
    working_dir = "${path.module}/ansible"
  }

  depends_on = [aws_eks_cluster.eks]
}
