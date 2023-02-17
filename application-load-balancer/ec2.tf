data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
resource "aws_instance" "instance" {
  count           = length(aws_subnet.public_subnet.*.id)
  ami             = data.aws_ami.amazon_linux.id
  subnet_id       = element(aws_subnet.public_subnet.*.id, count.index)
  security_groups = [aws_security_group.sg.id]
  key_name        = aws_key_pair.my_keypair.name

  tags = {
    Name = "instance-${count.index}"
  }
  timeouts {
    create = "10m"
  }
}
