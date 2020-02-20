resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "my_instance" {
  count         = var.instance_count
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = (var.instance_type)
  key_name      = aws_key_pair.mykey.key_name
  user_data     = file("WebServerScript.sh")

  provisioner "file" {
    source      = "WebServerScript.sh"
    destination = "/tmp/WebServerScript.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/WebServerScript.sh",
      "sudo /tmp/WebServerScript.sh"
    ]
  }
  connection {
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
    host        = self.public_ip
  }

  tags = {
    Name = "terraform-${count.index + 1}"
  }
}
