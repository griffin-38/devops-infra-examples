provider "aws" {
  region = "us-west-2" # Change to your desired region
}

module "eks" {
  source = "./modules/eks"
  cluster_name    = "my-eks-cluster"
  subnets         = ["subnet-xxxxxxxxxxxxxxx", "subnet-yyyyyyyyyyyyyyy", "subnet-zzzzzzzzzzzzzzzz"] # Add your subnet IDs
  vpc_id          = "vpc-xxxxxxxxxxxxxxxxx" # Add your VPC ID

  # Other module inputs...
  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      key_name = "eks-key"
    }
  }
}

# Additional configurations and resources as needed

