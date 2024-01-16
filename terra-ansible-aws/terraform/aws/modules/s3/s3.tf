provider "aws" {
  region = var.region
}

#resource creates an S3 bucket named "example-bucket" with versioning enabled, logging configured, and some tags.
resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-bucket"
  acl    = "private"
  
  versioning {
    enabled = true
  }

  logging {
    target_bucket = aws_s3_bucket.log_bucket.bucket
    target_prefix = "logs/"
  }

  tags = {
    Name        = "ExampleBucket"
    Environment = "Production"
  }
}

# aws_s3_bucket resource creates a separate log bucket.
resource "aws_s3_bucket" "log_bucket" {
  bucket = "example-log-bucket"
  acl    = "private"
}

