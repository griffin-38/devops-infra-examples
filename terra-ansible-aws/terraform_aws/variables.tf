# You can define additional variables here
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

# You can define additional variables here if needed
