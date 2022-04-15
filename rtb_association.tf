# Priv assc
resource "aws_route_table_association" "priv-sn-rtb-assc-1" {
  subnet_id      = aws_subnet.main-priv-sn-eu1a.id
  route_table_id = aws_route_table.priv-rtb-eu1a.id
}

resource "aws_route_table_association" "priv-sn-rtb-assc-2" {
  subnet_id      = aws_subnet.main-priv-sn-eu1b.id
  route_table_id = aws_route_table.priv-rtb-eu1b.id
}



# Pub assc
resource "aws_route_table_association" "pub-sn-rtb-assc-1" {
  subnet_id      = aws_subnet.main-pub-sn-eu1a.id
  route_table_id = aws_route_table.pub-rtb-eu1a.id
}

resource "aws_route_table_association" "pub-sn-rtb-assc-2" {
  subnet_id      = aws_subnet.main-pub-sn-eu1b.id
  route_table_id = aws_route_table.pub-rtb-eu1b.id
}
