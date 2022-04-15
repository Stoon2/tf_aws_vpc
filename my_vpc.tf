provider "aws" {
  # Configuration options
  profile = "default"
  region  = "eu-central-1"
}


resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "main"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-igw"
  }
}


resource "aws_nat_gateway" "eu-1a-ngw" {
  allocation_id = aws_eip.ngw-eip-eu1a.id
  subnet_id     = aws_subnet.main-pub-sn-eu1a.id
  tags = {
    Name = "eu-1a-ngw"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_nat_gateway" "eu-1b-ngw" {
  allocation_id = aws_eip.ngw-eip-eu1b.id
  subnet_id     = aws_subnet.main-pub-sn-eu1b.id
  tags = {
    Name = "eu-1b-ngw"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}


resource "aws_eip" "ngw-eip-eu1a" {
  #   public_ipv4_pool = amazon
  vpc = true
  tags = {
    Name = "eu-1a-eip"
  }
}
resource "aws_eip" "ngw-eip-eu1b" {
  #   public_ipv4_pool = amazon
  vpc = true
  tags = {
    Name = "eu-1b-eip"
  }
}
