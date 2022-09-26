resource "aws_route_table" "private" {
  vpc_id = aws_vpc.ermolaeva_vpc.id

  tags = {
    Name = "ermolaeva_private_rt"
  }
}

resource "aws_route" "private-route-nat" {
  route_table_id = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat.id
  depends_on = [aws_route_table.private]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.ermolaeva_vpc.id

  tags = {
    Name = "ermolaeva-public-rt"
  }
}

resource "aws_route" "public-route-igw" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.ermolaeva_igw.id
  depends_on = [aws_route_table.public]
}

resource "aws_route_table_association" "private-us-east-1a" {
 subnet_id = aws_subnet.private-us-east-1a.id
 route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-us-east-1b" {
 subnet_id = aws_subnet.private-us-east-1b.id
 route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public-us-east-1a" {
 subnet_id = aws_subnet.public-us-east-1a.id
 route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-us-east-1b" {
 subnet_id = aws_subnet.public-us-east-1b.id
 route_table_id = aws_route_table.public.id
}
