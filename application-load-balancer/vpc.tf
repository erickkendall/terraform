# Determine private and public subnets
locals {
  private_subnets = slice(cidrsubnets(var.custom_vpc, 8, 4, 4, 4, 4, 4), 3, 6)
  public_subnets  = slice(cidrsubnets(var.custom_vpc, 8, 4, 4, 4, 4, 4), 0, 3)
}

# Create VPC
resource "aws_vpc" "custom_vpc" {
  cidr_block                       = var.custom_vpc
  instance_tenancy                 = var.instance_tenancy
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false
}

# Create public subnets
resource "aws_subnet" "public_subnet" {
  count = var.custom_vpc == "10.0.0.0/16" ? 3 : 0

  vpc_id            = aws_vpc.custom_vpc.id
  availability_zone = data.aws_availability_zones.azs.names[count.index]
  #  cidr_block        = element(cidrsubnets(var.custom_vpc, 8, 4, 4), count.index)
  cidr_block = element(local.public_subnets, count.index)

  tags = {
    Name = "Public-Subnet-${count.index}"
  }
}

# Create private subnets
resource "aws_subnet" "private_subnet" {
  count = var.custom_vpc == "10.0.0.0/16" ? 3 : 0

  vpc_id            = aws_vpc.custom_vpc.id
  availability_zone = data.aws_availability_zones.azs.names[count.index]
  #  cidr_block        = element(cidrsubnets(var.custom_vpc, 2, 4, 4), count.index)
  cidr_block = element(local.private_subnets, count.index)

  tags = {
    Name = "Private-Subnet-${count.index}"
  }
}

# Crete Internet Gateway in order to access Internet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.custom_vpc.id
  tags = {
    Name = "Internet-Gateway"
  }
}

# Create public route table 
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.custom_vpc.id
  tags = {
    Name = "Public-RouteTable"
  }
}

# Create public route out to Internet
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Associate public subnets with public route table 
resource "aws_route_table_association" "public_rt_association" {
  count          = length(aws_subnet.public_subnet) == 3 ? 3 : 0 #  If there are fewer than 3 elements in the list, Terraform will create no instances.
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
}

# Create private route table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.custom_vpc.id
  tags = {
    Name = "Private-RouteTable"
  }
}

# Create route out to Internet
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Associate public subnets with public route table 
resource "aws_route_table_association" "private_rt_association" {
  count          = length(aws_subnet.private_subnet) == 3 ? 3 : 0 #  If there are fewer than 3 elements in the list, Terraform will create no instances.
  route_table_id = aws_route_table.private_rt.id
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
}

# Create Elastic IP for NAT Gateway
resource "aws_eip" "eip" {
  count            = length(aws_subnet.public_subnet.*.id)
  public_ipv4_pool = "amazon"
  vpc              = true
  tags = {
    Name = "EIP-${count.index}"
  }
}
# Create a NAT Gateway 
resource "aws_nat_gateway" "nat_gateway" {
  count         = length(aws_eip.eip.*.id)
  allocation_id = element(aws_eip.eip.*.id, count.index)
  subnet_id     = element(aws_subnet.public_subnet.*.id, count.index)
  tags = {
    Name = "nat-gateway-${count.index}"
  }
}
