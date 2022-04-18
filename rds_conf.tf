resource "aws_db_subnet_group" "rds_sn_group" {
  name       = "main"
  subnet_ids = [module.network.priv_sn_zone_1, module.network.priv_sn_zone_2]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "main_rds" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  db_name                = var.rds_name
  username               = var.rds_username
  password               = var.rds_password
  db_subnet_group_name   = aws_db_subnet_group.rds_sn_group.name
  vpc_security_group_ids = [aws_security_group.allow_3306_local.id]
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
}
