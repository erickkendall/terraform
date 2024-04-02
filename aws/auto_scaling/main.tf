# Create a new VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Create an Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

# Create two public subnets
resource "aws_subnet" "public_subnets" {
  count                   = 2
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.${count.index}.0/24"
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
}

# Create two private subnets
resource "aws_subnet" "private_subnets" {
  count                   = 2
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.${2 + count.index}.0/24"
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false
}

# Get the list of available Availability Zones
data "aws_availability_zones" "available" {
  state = "available"
}

# Create a Security Group for the Load Balancer
resource "aws_security_group" "lb_sg" {
  name_prefix = "lb-sg-"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

# Create a Security Group for the EC2 instance
resource "aws_security_group" "ec2_sg" {
  name_prefix = "ec2-sg-"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.lb_sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

# Find the latest Amazon Linux 2 AMI
data "aws_ssm_parameter" "amazon_linux_2_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

# Create a Launch Configuration for the Auto Scaling group
resource "aws_launch_configuration" "nginx_launch_config" {
  name_prefix     = "nginx-launch-config-"
  image_id        = data.aws_ssm_parameter.amazon_linux_2_ami.value
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.ec2_sg.id]
  user_data       = <<-EOF
#!/bin/bash
yum update -y
amazon-linux-extras install -y nginx1
systemctl start nginx
EOF

  lifecycle {
    create_before_destroy = true
  }
}

# Create an Auto Scaling group
resource "aws_autoscaling_group" "nginx_asg" {
  name                 = "nginx-asg"
  launch_configuration = aws_launch_configuration.nginx_launch_config.name
  vpc_zone_identifier  = aws_subnet.private_subnets[*].id
  min_size             = var.min_instances
  max_size             = var.max_instances
  desired_capacity     = var.desired_instances

  tag {
    key                 = "Name"
    value               = "nginx-ec2"
    propagate_at_launch = true
  }
}

# Create an Application Load Balancer
resource "aws_lb" "nginx_alb" {
  name               = "nginx-alb"
  load_balancer_type = "application"
  subnets            = aws_subnet.public_subnets[*].id
  security_groups    = [aws_security_group.lb_sg.id]
}

# Create a Target Group for the Load Balancer
resource "aws_lb_target_group" "nginx_tg" {
  name        = "nginx-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "instance"
}

# Create a Listener for the Load Balancer
resource "aws_lb_listener" "nginx_listener" {
  load_balancer_arn = aws_lb.nginx_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx_tg.arn
  }
}

# Attach the Auto Scaling group to the Target Group
resource "aws_autoscaling_attachment" "nginx_asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.nginx_asg.id
  lb_target_group_arn    = aws_lb_target_group.nginx_tg.arn
}

# Create an Elastic IP for the NAT Gateway
resource "aws_eip" "nat_eip" {
  count = 1
}

# Create a NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip[0].id
  subnet_id     = aws_subnet.public_subnets[0].id
  depends_on    = [aws_internet_gateway.main]
}

# Create a public route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

# Associate public subnets with the public route table
resource "aws_route_table_association" "public_subnet_association" {
  count          = length(aws_subnet.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

# Create a private route table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
}

# Associate private subnets with the private route table
resource "aws_route_table_association" "private_subnet_association" {
  count          = length(aws_subnet.private_subnets)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_rt.id
}

# Output the DNS name of the Load Balancer
output "alb_dns_name" {
  value = aws_lb.nginx_alb.dns_name
}
