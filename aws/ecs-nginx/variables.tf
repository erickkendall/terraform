variable "aws_region" {
  description = "The AWS region to deploy resources."
  default     = "us-east-1"
}
variable "subnet_count" {
  description = "The number of instances to launch."
  default     = 2
}
