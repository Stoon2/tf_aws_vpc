# VPC main CIDR
vpc_main_cidr = "10.0.0.0/16"

# Public subnet CIDR
pub_sn_1_cidr = "10.0.1.0/24"
pub_sn_2_cidr = "10.0.2.0/24"

# Private subnet CIDR
priv_sn_1_cidr = "10.0.3.0/24"
priv_sn_2_cidr = "10.0.4.0/24"

# Availibility Zones
az-1 = "eu-central-1a"
az-2 = "eu-central-1b"

# RDS Conf
rds_name     = "*"
rds_username = "*"
rds_password = "*"

# Email for SES to register
email = "*"
# Name of S3 bucket that holds your lock file
s3_bucket = "*"
# ARN of bucket that holds your lock file
s3_bucket_arn = "arn:aws:s3:::iti-private-bucket"
# Region your provider is currently on
region = "eu-central-1"
