resource "aws_eip" "ngw-eip-eu1a" {
  #   public_ipv4_pool = amazon
  vpc = true
  tags = {
    Name = "eip-pub-zone-1"
  }
}
resource "aws_eip" "ngw-eip-eu1b" {
  #   public_ipv4_pool = amazon
  vpc = true
  tags = {
    Name = "eip-pub-zone-2"
  }
}
