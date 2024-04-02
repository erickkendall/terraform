locals {
  ingress_rules = [{
    port        = 443
    description = "HTTPS"
    },
    {
      port        = 80
      description = "HTTP"
  }]
}

resource "aws_security_group" "main" {
  name = "sg"
  dynamic "ingress" {
    for_each = local.ingress_rules

    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
