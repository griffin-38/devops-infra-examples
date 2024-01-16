variable "zone_0" {
  description = "The AWS zone for resource placement (Zone 0)"
  default     = "us-east1-b"
}

variable "zone_1" {
  description = "The AWS zone for resource placement (Zone 1)"
  default     = "us-east1-c"
}

variable "region_0" {
  description = "The AWS region for resource placement (Region 0)"
  default     = "ap-southeast-0"
}

variable "region_1" {
    description = "The AWS region for resource placement (Region 1)"
    default     = "ap-southeast-2"
}

variable "ami" {
  description = "Amazon Linux AMI"
  default = "ami-04d10c7d"
}

variable "instance_type" {
  description = "Instance type"
  default = "t2.micro"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "/path-to-keyfile/docker-key.pem"
}

variable "key_name" {
  description = "Desired name of Keypair..."
  default = "docker-key"
}

variable "bootstrap_path" {
  description = "Script to install Docker Engine"
  default = "install_docker_machine_compose.sh"
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


# You can define additional variables here if needed
