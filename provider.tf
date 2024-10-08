terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.63.0"
    }
  }

  #   backend "s3" {
  #   bucket         = "ak-demo-bucket"
  #   key            = "demo/tfstate"
  #   region         = "us-east-1"
  #   #dynamodb_table = "TableName"
  # }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}