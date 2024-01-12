data "aws_ip_ranges" "us_ec2" {
  regions  = [var.AWS_REGION]
  services = ["ec2"]
}

resource "aws_security_group" "from_us" {
  name   = "from_us"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = data.aws_ip_ranges.us_ec2.cidr_blocks
  }

  tags = {
    CreateDate = data.aws_ip_ranges.us_ec2.create_date
    SyncToken  = data.aws_ip_ranges.us_ec2.sync_token
  }
}
