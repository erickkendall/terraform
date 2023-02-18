# Let's find the most recent image versus hard coding
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
# Create an EC2 instance in each private subnet 
resource "aws_instance" "instance" {
  count           = length(aws_subnet.private_subnet.*.id)
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type
  subnet_id       = element(aws_subnet.private_subnet.*.id, count.index)
  security_groups = [aws_security_group.sg.arn]
  key_name        = aws_key_pair.generated_key.key_name

  user_data = <<EOF
#!/bin/bash
sudo apt-get update  -y
sudo apt-get install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo echo "<html><head><title>Hello World</title></head><body><h1>Hello World!</h1></body></html>" > /var/www/html/index.html

EOF

  tags = {
    Name = "instance-${count.index}"
  }
  timeouts {
    create = "10m"
  }
}
