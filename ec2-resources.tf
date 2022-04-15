resource "aws_instance" "bastion" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.main-pub-sn-eu1a.id
  associate_public_ip_address = "true"
  vpc_security_group_ids      = [aws_security_group.allow_ssh_all.id]
  key_name                    = var.key_name
  tags = {
    Name = "Bastion Host"
  }
}

resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.main-priv-sn-eu1a.id
  vpc_security_group_ids = [aws_security_group.allow_ssh_p3000_local.id]
  key_name               = var.key_name
  tags = {
    Name = "App Server"
  }
}
