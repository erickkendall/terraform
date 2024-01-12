resource "aws_lb" "comcast" {
  name               = "comcast-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = aws_subnet.public_subnet.*.id
}
resource "aws_lb_listener" "http_redirect" {
  load_balancer_arn = aws_lb.comcast.arn
  port              = "80"
  protocol          = "HTTP"



  default_action {
    type = "redirect"
    redirect {
      protocol    = "HTTPS"
      port        = "443"
      status_code = "HTTP_301"
    }
  }
}
resource "aws_lb_listener" "example" {
  load_balancer_arn = aws_lb.comcast.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
  certificate_arn   = aws_iam_server_certificate.test_cert.arn


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.comcast.arn
  }
}
resource "aws_lb_target_group" "comcast" {
  name_prefix = "tg-ex"
  port        = 443
  protocol    = "HTTPS"
  vpc_id      = aws_vpc.custom_vpc.id

  health_check {
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = "/index.html"
#    port                = "traffic-port"
    port                = 80
    protocol            = "HTTPS"
    timeout             = 5
    unhealthy_threshold = 2
  }
}
resource "aws_alb_target_group_attachment" "tgattachment" {
  count            = length(aws_instance.instance.*.id) == 3 ? 3 : 0
  target_group_arn = aws_lb_target_group.comcast.arn
  target_id        = element(aws_instance.instance.*.id, count.index)
}
#resource "aws_lb_listener_certificate" "example" {
#  listener_arn    = aws_lb_listener.example.arn
#  certificate_arn = aws_iam_server_certificate.test_cert.arn
#}
