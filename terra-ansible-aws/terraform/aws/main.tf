# provider "aws" Block: Configures the AWS provider with the specified access key, secret key, and region. 
# These values are expected to be provided through variables (var.access_key, var.secret_key, var.region).
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

# module "eks" Block: Utilizes the eks module located in the "./modules/eks" directory.
# Specifies inputs for the module, such as cluster_name, subnets, vpc_id, and security group IDs (sec_group_1, sec_group_2, sec_group_3, sec_group_4).
# Additionally, defines node_groups within the EKS cluster with specific capacity settings and a key name.
module "eks" {
  source        = "./modules/eks"
  cluster_name  = "my-eks-cluster"
  subnets       = ["subnet-xxxxxxxxxxxxxxx", "subnet-yyyyyyyyyyyyyyy", "subnet-zzzzzzzzzzzzzzzz"] # Add your subnet IDs
  vpc_id        = "vpc-xxxxxxxxxxxxxxxxx" # Add your VPC ID
  sec_group_1   = "sg-0123456789abcdef0"
  sec_group_2   = "sg-1234567890abcdef1"
  sec_group_3   = "sg-234567890abcdef2"
  sec_group_4   = "sg-345678901abcdef3"
  
  # Other module inputs...
  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      key_name         = "eks-key"
    }
  }
}


#module "ec2" Block: Utilizes the ec2 module located in the "./ec2" directory.
# Specifies security group IDs (sec_group_1, sec_group_2, sec_group_3, sec_group_4) as inputs for the module.
module "ec2" {
  source        = "./ec2"
  sec_group_1   = "sg-0123456789abcdef0"
  sec_group_2   = "sg-1234567890abcdef1"
  sec_group_3   = "sg-234567890abcdef2"
  sec_group_4   = "sg-345678901abcdef3"
}


# module "s3" Block: Utilizes the s3 module located in the "./s3" directory. 
# Specifies security group IDs (sec_group_1, # sec_group_2, sec_group_3, sec_group_4) as inputs for the module.
module "s3" {
  source        = "./s3"
  sec_group_1   = "sg-0123456789abcdef0"
  sec_group_2   = "sg-1234567890abcdef1"
  sec_group_3   = "sg-234567890abcdef2"
  sec_group_4   = "sg-345678901abcdef3"
}


# module "lambda" Block: Utilizes the lambda module located in the "./lambda" directory. 
# Specifies security group IDs  (sec_group_1, sec_group_2, sec_group_3, sec_group_4) as inputs for the module.

module "lambda" {
  source        = "./lambda"
  sec_group_1   = "sg-0123456789abcdef0"
  sec_group_2   = "sg-1234567890abcdef1"
  sec_group_3   = "sg-234567890abcdef2"
  sec_group_4   = "sg-345678901abcdef3"
}


# Define other resources or configurations here
