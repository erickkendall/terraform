resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}
resource "aws_instance" "example_one" {
  ami           = "ami-0b786a1a999c4e98e"
  subnet_id     = "subnet-927b3abc"
  instance_type = "t2.micro"
}
resource "aws_instance" "example_two" {
  ami           = "ami-06a884a590e55d759"
  subnet_id     = "subnet-a1fa0ed9"
  instance_type = "t2.micro"
}
resource "aws_instance" "example_three" {
  ami           = "ami-04b331702444679c3"
  subnet_id     = "subnet-68c63b13"
  instance_type = "t2.micro"
}
