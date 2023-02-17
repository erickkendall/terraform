resource "aws_lb_target_group" "tg" {
  name        = "TargetGroup"
  port        = 80
  target_type = instance
  protocol    = "HTTP"
  vpc_id      = aws_vpc.custom_vpc.id
}

