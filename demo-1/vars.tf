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
    "us-east-1" = "ami-046842448f9e74e7d"
    "us-east-2" = "ami-0367b500fdcac0edc"
  }
}

