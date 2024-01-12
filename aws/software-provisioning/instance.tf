# use existing SSH public key 
resource "aws_key_pair" "generated_key" {
  key_name   = "my_key"
  public_key = file("~/.ssh/id_rsa.pub")
}
resource "aws_instance" "example" {
  ami                    = lookup(var.AMIS, var.AWS_REGION)
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.generated_key.key_name
  subnet_id              = "subnet-078965c2d4c7e504c"
  vpc_security_group_ids = [aws_security_group.example.id]
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.example.public_ip
  }
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh > /tmp/output.txt"
    ]
  }
}
