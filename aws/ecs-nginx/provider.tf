# provider.terraform

provider "aws" {
  region = var.aws_region
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
