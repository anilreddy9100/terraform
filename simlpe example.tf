terraform {
 required_version = ">=1.0.0" //we can restrict vrersion of terafoorm what we want 
 required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.63.0" // we can restrict tne version of provider 
    }
  }
}

provider "aws" {
  region = "ap-south-1" // we can use region were we need to create a resources
  # Configuration options
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}