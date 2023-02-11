data "aws_caller_identity" "current" {}
module "my-ecs" {
  source         = "github.com/in4it/terraform-modules//modules/ecs-cluster"
  vpc_id         = module.vpc.vpc_id
  cluster_name   = "my-ecs"
  instance_type  = "t3.small"
  ssh_key_name   = aws_key_pair.mykeypair.key_name
  vpc_subnets    = join(",", module.vpc.public_subnets)
  enable_ssh     = true
  log_group      = "my-log-group"
  aws_account_id = data.aws_caller_identity.current.account_id
  aws_region     = var.AWS_REGION
}
module "my-service" {
  source              = "github.com/in4it/terraform-modules//modules/ecs-service"
  vpc_id              = module.vpc.vpc_id
  application_name    = "my-service"
  application_port    = "8080"
  application_version = "latest"
  cluster_arn         = module.my-ecs.cluster_arn
  service_role_arn    = module.my-ecs.service_role_arn
  aws_region          = var.AWS_REGION
  healthcheck_matcher = "200"
  cpu_reservation     = "1024"
  memory_reservation  = "1024"
  log_group           = "my-log-group"
  desired_count       = 2
  alb_arn             = module.my-alb.alb_arn
}
module "my-alb" {
  source             = "github.com/in4it/terraform-modules/modules/alb"
  vpc_id             = module.vpc.vpc_id
  lb_name            = "my-alb"
  vpc_subnets        = join(",", module.vpc.public_subnets)
  default_target_arn = module.my-service.target_group_arn
  domain             = "*.my-ecs.com"
  internal           = false
  ecs_sg             = module.my-ecs.cluster_sg
}
