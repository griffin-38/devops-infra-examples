variable "cluster_name" {
  description = "Name for the EKS cluster"
}

variable "subnets" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where the EKS cluster will be deployed"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public key used for worker nodes"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key used for worker nodes"
  type        = string
}

variable "ssh_user" {
  description = "SSH user name to connect to your instance."
  default     = "omixalot"
}

# You can define additional variables here if needed
