resource "aws_vpc" "wanderlust_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    name = "wanderlust_vpc"
  }
}

resource "aws_subnet" "wanderlust_subnet" {

  vpc_id                  = aws_vpc.wanderlust_vpc.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "wanderlust_subnet"
  }
}

resource "aws_internet_gateway" "wanderlust_igw" {
  vpc_id = aws_vpc.wanderlust_vpc.id
  tags = {
    Name = "wanderlust_igw"
  }
}

resource "aws_route_table" "wanderlust_rt" {

  vpc_id = aws_vpc.wanderlust_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wanderlust_igw.id
  }

  tags = {

    Name = "wanderlust_rt"
  }
}

resource "aws_route_table_association" "wanderlust_rta" {
  subnet_id      = aws_subnet.wanderlust_subnet.id
  route_table_id = aws_route_table.wanderlust_rt.id
}