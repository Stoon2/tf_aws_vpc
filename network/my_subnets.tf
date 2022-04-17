resource "aws_subnet" "main-pub-sn-eu1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.pub_sn_1_cidr
  availability_zone = var.az-1

  tags = {
    Name = "main-pub-sn-${var.az-1}"
  }
}

resource "aws_subnet" "main-pub-sn-eu1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.pub_sn_2_cidr
  availability_zone = var.az-2
  tags = {
    Name = "main-pub-sn-${var.az-2}"
  }
}

resource "aws_subnet" "main-priv-sn-eu1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.priv_sn_1_cidr
  availability_zone = var.az-1
  tags = {
    Name = "main-priv-sn-${var.az-1}"
  }
}

resource "aws_subnet" "main-priv-sn-eu1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.priv_sn_2_cidr
  availability_zone = var.az-2
  tags = {
    Name = "main-priv-sn-${var.az-2}"
  }
}
