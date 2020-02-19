terraform {
  backend "s3" {
    bucket = "terraform-tfstate-442327582670"
    key    = "terraform/demo-4"
  }
}
