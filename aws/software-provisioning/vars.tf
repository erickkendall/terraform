variable "AWS_REGION" {
  default = "us-east-1"
}
variable "AMIS" {
  description = "https://cloud-images.ubuntu.com/locator/ec2/"
  type        = map(any)
  default = {
    us-east-1 = "ami-0778521d914d23bc1"
    us-east-2 = "ami-00149760ce42c967b"
  }
}
