resource "aws_route_table" "priv-rtb-eu1a" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eu-1a-ngw.id
  }
  tags = {
    Name = "priv-rtb-${var.az-1}"
  }
}

resource "aws_route_table" "priv-rtb-eu1b" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eu-1b-ngw.id
  }
  tags = {
    Name = "priv-rtb-${var.az-2}"
  }
}
