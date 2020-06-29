variable "AWS_ACCESS_KEY" {

}
variable "AWS_SECRET_KEY" {

}
variable "AWS_REGION" {
  default = "us-east-1"

}
variable "AMIS" {
  type = map
  default = {
    us-east-1  = "ami-0b786a1a999c4e98e"
    us-west-2  = "ami-06a884a590e55d759"
    eu-north-1 = "ami-04b331702444679c3"
  }
}

variable "aws_regions" {
  description = "list of AWS regions"
  type        = list(string)
  default     = ["us-east-1", "eu-north-1", "us-west-2"]
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
