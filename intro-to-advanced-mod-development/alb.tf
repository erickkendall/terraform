resource "aws_alb" "alb" {
  name = var.alb_name
  subnets = [module.vpc.public_subnets[1]] 
  security_groups = 
  internal = false
}
