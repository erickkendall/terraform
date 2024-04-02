variable "private_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
    "10.0.7.0/24",
    "10.0.8.0/24",
    "10.0.9.0/24",
    "10.0.10.0/24",
  ]
}
variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = list(string)
  default = [
    "10.0.10.0/24",
    "10.0.20.0/24",
    "10.0.30.0/24",
    "10.0.40.0/24",
    "10.0.50.0/24",
    "10.0.60.0/24",
    "10.0.70.0/24",
    "10.0.80.0/24",
    "10.0.90.0/24",
    "10.0.100.0/24",
  ]
}
variable "instance_count" {
  description = "The number of instances to launch"
  type        = number
  default     = 6 # cannot exceed the number of availability zones in the region
}
# Define variables for the Auto Scaling group
variable "min_instances" {
  description = "Minimum number of instances in the Auto Scaling group"
  type        = number
  default     = 2
}

variable "max_instances" {
  description = "Maximum number of instances in the Auto Scaling group"
  type        = number
  default     = 5
}

variable "desired_instances" {
  description = "Desired number of instances in the Auto Scaling group"
  type        = number
  default     = 3
}
