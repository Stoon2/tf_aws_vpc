resource "aws_route_table" "pub-rtb-eu1a" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "pub-rtb-${var.az-1}"
  }
}

resource "aws_route_table" "pub-rtb-eu1b" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "pub-rtb-${var.az-2}"
  }
}
