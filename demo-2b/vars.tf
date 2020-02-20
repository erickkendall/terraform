variable "AMIS" {
  type = map
  default = {
    us-east-1      = "ami-002cc39e7bf021a77"
    us-east-2      = "ami-0fb3bb3e1ae2da0be"
    ap-northeast-1 = "ami-0310e62011e175a3a"
  }
}
variable "instance_count" {
  default = "2"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "instance_type" {
  default = "a1.medium"
}
variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-east-1"
}
