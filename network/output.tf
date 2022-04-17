# output "instance_id" {
#   description = "ID of the EC2 instance"
#   value       = aws_instance.app_server.id
# }

# output "instance_public_ip" {
#   description = "Public IP address of the EC2 instance"
#   value       = aws_instance.app_server.public_ip
# }

# output "instance_public_dns" {
#   description = "Public IP address of the EC2 instance"
#   value       = aws_instance.app_server.public_dns
# }

# Produce VPC variables 

output "vpc_main_id" {
  description = "id of the main vpc"
  value       = aws_vpc.main.id
}

output "vpc_main_cidr" {
  description = "cidr block for vpc"
  value       = var.vpc_main_cidr
}

output "pub_sn_zone_1" {
  value = aws_subnet.main-pub-sn-eu1a.id
}

output "pub_sn_zone_2" {
  value = aws_subnet.main-pub-sn-eu1b.id
}

output "priv_sn_zone_1" {
  value = aws_subnet.main-priv-sn-eu1a.id
}

output "priv_sn_zone_2" {
  value = aws_subnet.main-priv-sn-eu1b.id
}
