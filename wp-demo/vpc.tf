resource "aws_vpc" "wordpress-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "wordpress-vpc"
  }
}

resource "aws_subnet" "wordpress-subnet-1a" {
  vpc_id            = aws_vpc.wordpress-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "wordpress-subnet-10.0.1.0/24"
  }
}
resource "aws_subnet" "wordpress-subnet-1b" {
  vpc_id            = aws_vpc.wordpress-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "wordpress-subnet-10.0.2.0/24"
  }
}
