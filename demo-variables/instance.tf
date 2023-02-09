resource "aws_instance" "example" {
  ami = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  subnet_id = "subnet-078965c2d4c7e504c"
}
