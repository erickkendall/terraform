provider "aws" {
  region = "us-east-1"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.20.0"
    }
  }
  required_version = "~> 1.0"
}
