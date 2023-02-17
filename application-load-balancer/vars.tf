variable "AWS_REGION" {
  description = "Where to deploy resources in AWS."
  type        = string
  default     = "us-east-1"
}
variable "custom_vpc" {
  description = "VPC for the environment"
  type        = string
  default     = "10.0.0.0/16"
}
variable "instance_tenancy" {
  description = "whether VPC is default or dedicated"
  type        = string
  default     = "default"
}
variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}
variable "ssh_private_key" {
  description = "PEM file used to log into EC2 instances."
  default     = "mykeypar.pem"
}


