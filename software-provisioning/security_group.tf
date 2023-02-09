resource "aws_security_group" "example" {
  name        = "example"
  description = "Example security group"
  vpc_id      = "vpc-02ad952ec37c76430"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

