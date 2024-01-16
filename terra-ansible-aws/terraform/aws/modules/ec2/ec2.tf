
# AWS Security Group
resource "aws_security_group" "aws1" {
  # Name and description of the security group
  name        = "Default Security Group"
  description = "Allows all traffic"
    
  # Ingress rule allowing all incoming traffic
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rule allowing all outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# AWS Instances
resource "aws_instance" "launch_instance" {
  # AMI ID for the instance
  ami                  = var.ami

  # Instance type (e.g., t2.micro)
  instance_type        = "t2.micro"

  # Key pair for SSH access
  key_name             = "project123"

  # Availability zone for the instance
  availability_zone    = var.zone

  # Security group(s) associated with the instance
  security_group_names = [var.sec_group_1]

  # Public IP for the instance
  public_ip            = var.public_ip

  # Tags for identifying the instance
  tags = {
    Name = "instance1"
  }
}

# Another example AWS Instance
resource "aws_instance" "example" {
  # AMI ID for the instance
  ami                  = "ami-abc12345"

  # Instance type (e.g., t2.micro)
  instance_type        = "t2.micro"

  # Key pair for SSH access
  key_name             = "example-keypair"

  # Availability zone for the instance
  availability_zone    = var.zone

  # Security group(s) associated with the instance
  security_group_names = [var.sec_group_1]

  # Tags for identifying the instance
  tags = {
    Name = "example-instance"
  }
}
