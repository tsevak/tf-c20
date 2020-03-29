resource "aws_vpc" "myvpc" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "myvpc"
  }
}
#internal Subnets
resource "aws_subnet" "private-A" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.1.10.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-southeast-2a"
  tags = {
    Name = "private-A"
  }

}
resource "aws_subnet" "private-B" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.1.20.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-southeast-2b"
  tags = {
    Name = "private-B"
  }

}
# external subnets
resource "aws_subnet" "public-A" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.1.30.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-southeast-2a"
  tags = {
    Name = "public-A"
  }

}
resource "aws_subnet" "public-B" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.1.40.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-southeast-2b"
  tags = {
    Name = "public-B"
  }

}

#IG
resource "aws_internet_gateway" "myvpc-IGW" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "myvpc-IGW"
  }
}

# route table for public subnets

resource "aws_route_table" "public-igw" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myvpc-IGW.id
  }

  tags = {
    Name = "myvpc-IG-route-table"
  }
}

# IGW route table for public subnets
resource "aws_route_table_association" "public-A-IGW-route" {
  subnet_id      = aws_subnet.public-A.id
  route_table_id = aws_route_table.public-igw.id 
}
resource "aws_route_table_association" "public-B-IGW-route" {
  subnet_id      = aws_subnet.public-B.id
  route_table_id = aws_route_table.public-igw.id 
}

##elastic ip - NatGW

resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "myvpc-nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-A.id
  depends_on    = [aws_internet_gateway.myvpc-IGW]
  tags = {
    Name = "myvpc-nat-gw"
  }
}

# route table for  NAT Gateway
resource "aws_route_table" "private-nat-gw" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.myvpc-nat-gw.id
  }

  tags = {
    Name = "myvpc-nat-gw-route-table"
  }
}


# NAT Gateway route table for private subnets.
resource "aws_route_table_association" "private-A-nat-gw-route" {
  subnet_id      = aws_subnet.private-A.id
  route_table_id = aws_route_table.private-nat-gw.id
}
resource "aws_route_table_association" "public-B-nat-gw-route" {
  subnet_id      = aws_subnet.private-B.id
  route_table_id = aws_route_table.private-nat-gw.id
}