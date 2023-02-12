data "aws_availability_zones" "available" {
  state = "available"

  filter {
    name   = "zone-type"
    values = ["availability-zone"]
  }
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "my-vpc"
  cidr   = "10.0.0.0/16"

  azs             = data.aws_availability_zones.available.names
  private_subnets = slice(var.private_subnets_cidr_blocks, 0, var.private_subnets_per_vpc)
  public_subnets  = slice(var.private_subnets_cidr_blocks, 0, var.private_subnets_per_vpc)

  enable_nat_gateway = true
  enable_vpn_gateway = false

  map_public_ip_on_launch = false
}
