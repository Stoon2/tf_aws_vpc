resource "aws_instance" "bastion" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = module.network.pub_sn_zone_1
  associate_public_ip_address = "true"
  vpc_security_group_ids      = [aws_security_group.allow_ssh_all.id]
  key_name                    = var.key_name
  tags = {
    Name = "Bastion Client"
  }
}

resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = module.network.priv_sn_zone_1
  vpc_security_group_ids = [aws_security_group.allow_ssh_p3000_local.id]
  key_name               = var.key_name
  tags = {
    Name = "App Server"
  }
}
