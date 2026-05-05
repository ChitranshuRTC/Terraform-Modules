# resource to create vpc
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

# resource to create public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_name}-public-subnet"
  }
}

#resource to create private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone
  tags = {
    Name = "${var.vpc_name}-private-subnet"
  }
}

#resource to create internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

#resource to create route tables
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

#resource to create private route table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.vpc_name}-private-rt"
  }
}

#resource to create route to internet gateway
resource "aws_route" "igw_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = var.public_route_cidr
  gateway_id             = aws_internet_gateway.internet_gateway.id
}

# associate public route table
resource "aws_route_table_association" "association_public_rt" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# associate private route table
resource "aws_route_table_association" "association_private_rt" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}

#resource to create elastic ip
resource "aws_eip" "elastic_ip" {
  domain = "vpc"
  tags = {
    Name = "nat-eip"
  }
}

#resource to create nat gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    Name = "nat-gateway"
  }
}

# route for private subnet to use nat gateway
resource "aws_route" "private_nat_route" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = var.public_route_cidr
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}
