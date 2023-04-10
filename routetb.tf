resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    # gateway_id = aws_internet_gateway.example.id
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "private route-tb"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
    # nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "public route-tb"
  }
}

resource "aws_route_table_association" "private-southeast-1a" {
  subnet_id      = aws_subnet.private-southeast-1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-southeast-1b" {
  subnet_id      = aws_subnet.private-southeast-1b.id
  route_table_id = aws_route_table.private.id
}


resource "aws_route_table_association" "public-southeast-1a" {
  subnet_id      = aws_subnet.public-southeast-1a.id
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "public-southeast-1b" {
  subnet_id      = aws_subnet.public-southeast-1b.id
  route_table_id = aws_route_table.public.id
}