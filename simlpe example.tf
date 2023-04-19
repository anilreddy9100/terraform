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
  # Configuration options
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}