resource "aws_security_group" "allow_ssh_all" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.network.vpc_main_id

  ingress {
    description = "SSH from ALL"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}


resource "aws_security_group" "allow_ssh_p3000_local" {
  name        = "allow_ssh_p3000_local"
  description = "Allow SSH and Port 3000 traffic locally"
  vpc_id      = module.network.vpc_main_id

  ingress {
    description = "SSH local"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [module.network.vpc_main_cidr]
  }

  ingress {
    description = "Port 3000 local"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [module.network.vpc_main_cidr]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_security_group" "allow_3306_local" {
  name        = "allow_3306_local"
  description = "Allow P3306 inbound traffic locally"
  vpc_id      = module.network.vpc_main_id

  ingress {
    description = "P3306 from local"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [module.network.vpc_main_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
