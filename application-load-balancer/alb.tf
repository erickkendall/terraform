resource "aws_lb" "example" {
  name               = "example-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = aws_subnet.public_subnet.*.id
}
resource "aws_lb_listener" "example" {
  load_balancer_arn = aws_lb.example.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.example.arn
    type             = "forward"
  }
}
resource "aws_lb_target_group" "example" {
  name_prefix = "tg-ex"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.custom_vpc.id

  health_check {
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
}
resource "aws_alb_target_group_attachment" "tgattachment" {
  count            = length(aws_instance.instance.*.id) == 3 ? 3 : 0
  target_group_arn = aws_lb_target_group.example.arn
  target_id        = element(aws_instance.instance.*.id, count.index)
}
