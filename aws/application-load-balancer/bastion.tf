resource "aws_eip" "bastion-eip" {
  instance = aws_instance.bastion-host.id
  vpc      = true
}

resource "aws_instance" "bastion-host" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t3.micro"
  subnet_id       = aws_subnet.public_subnet[0].id
  security_groups = [aws_security_group.allow_ssh.id]
  key_name        = aws_key_pair.generated_key.key_name
  connection {
    type        = ssh
    host        = this
    user        = "ubuntu"
    agent       = false
    private_key = tls_private_key.example.name
  }
  tags = {
    Name = "bastion"
  }
}

resource "aws_security_group" "allow_ssh" {
  name   = "allow-ssh"
  vpc_id = aws_vpc.custom_vpc.id
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
  # Terraform removes the default rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
