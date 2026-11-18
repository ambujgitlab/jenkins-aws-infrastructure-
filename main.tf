
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "jenkins_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "Jenkins-Deployment-Bucket"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.jenkins_bucket.bucket
}
