variable "vpc_id" {
  description = "VPC ID where the EKS cluster will be deployed."
  type        = string
  default     = "your-vpc-id-here"
}

variable "access_key" {
  description = "Path to the AWS access key used for worker nodes."
  type        = string
  default     = "your-access-key"
}

variable "secret_key" {
  description = "Path to the AWS secret key used for worker nodes."
  type        = string
  default     = "your-secret-key"
}

variable "ssh_user" {
  description = "SSH user name to connect to your instance, with a default value of 'lubakjohnson38'."
  type        = string
  default     = "your-ssh-username"
}

variable "ami" {
  description = "Amazon Linux AMI"
  default     = "ami-04d10c7d"
}

variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}

variable "key_path" {
  description = "SSH Public Key path"
  default     = "/path-to-keyfile/docker-key.pem"
}

variable "key_name" {
  description = "Desired name of Keypair..."
  default     = "docker-key"
}

variable "sec_group_1" {
  description = "Security Group 1"
  default     = "sg-0123456789abcdef0"
}

variable "sec_group_2" {
  description = "Security Group 2"
  default     = "sg-0123456789abcdef1"
}

variable "sec_group_3" {
  description = "Security Group 3"
  default     = "sg-0123456789abcdef2"
}

variable "sec_group_4" {
  description = "Security Group 4"
  default     = "sg-0123456789abcdef3"
}

variable "zone_0" {
  description = "The AWS zone for resource placement (Zone 0)"
  default     = "us-east1-b"
}

variable "zone_1" {
  description = "The AWS zone for resource placement (Zone 1)"
  default     = "us-east1-c"
}

variable "zone_3" {
  description = "The AWS zone for resource placement (Zone 0)"
  default     = "us-east1-d"
}

variable "region_0" {
  description = "The AWS region for resource placement (Region 0)"
  default     = "ap-southeast-0"
}

variable "region_1" {
  description = "The AWS region for resource placement (Region 1)"
  default     = "ap-southeast-2"
}

variable "eks_region" {
  description = "AWS region for EKS"
  type        = string
  default     = "us-east-1"
}

variable "eks_availability_zones" {
  description = "List of availability zones for EKS"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "my-eks-cluster"
}

variable "eks_cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.21"
}

variable "worker_node_instance_type" {
  description = "Instance type for worker nodes"
  type        = string
  default     = "t2.micro"
}

variable "worker_node_desired_capacity" {
  description = "Desired capacity for worker nodes Auto Scaling Group"
  type        = number
  default     = 2
}

# Define more variables as needed

