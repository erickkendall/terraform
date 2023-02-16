terraform {
  backend "s3" {
    bucket = "abomasum"
    key    = "terraform"
    region = "us-east-1"
  }
}
provider "aws" {
  region = "us-east-1"
}
