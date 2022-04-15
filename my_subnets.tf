resource "aws_subnet" "main-pub-sn-eu1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "main-pub-sn-eu1a"
  }
}

resource "aws_subnet" "main-pub-sn-eu1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-central-1b"
  tags = {
    Name = "main-pub-sn-eu1b"
  }
}

resource "aws_subnet" "main-priv-sn-eu1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-central-1a"
  tags = {
    Name = "main-priv-sn-eu1a"
  }
}

resource "aws_subnet" "main-priv-sn-eu1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "eu-central-1b"
  tags = {
    Name = "main-priv-sn-eu1b"
  }
}
