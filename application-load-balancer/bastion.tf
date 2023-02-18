resource "aws_eip" "bastion-eip" {
  instance = aws_instance.bastion-host.id
  vpc      = true
}

resource "aws_instance" "bastion-host" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private_subnet[0].id
  key_name      = aws_key_pair.generated_key.key_name
  tags = {
    Name = "bastion"
  }
}
