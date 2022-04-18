variable "key_name" {
  description = "My Default SSH key"
  type        = string
  # default     = "ec2_test"
  default = "myKey"
}

variable "ami_id" {
  description = "AMI Ubuntu"
  type        = string
  # EU instance
  default = "ami-0d527b8c289b4af7f"
  # US East Instance
  # default = "ami-04505e74c0741db8d"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "vpc_main_cidr" {
  type        = string
  description = "provide main cidr block for your vpc"
}

variable "pub_sn_1_cidr" {
  type        = string
  description = "public subnet cidr"
}

variable "pub_sn_2_cidr" {
  type        = string
  description = "public subnet cidr"
}

variable "priv_sn_1_cidr" {
  type        = string
  description = "private subnet cidr"
}

variable "priv_sn_2_cidr" {
  type        = string
  description = "private subnet cidr"
}

variable "az-1" {
  type        = string
  description = "first availibility zone"
}

variable "az-2" {
  type        = string
  description = "second availibility zone"
}

# RDS configuration
variable "rds_username" {
  type = string
}

variable "rds_password" {
  type = string
}

variable "rds_name" {
  type = string
}

variable "email" {
  type = string
}

variable "s3_bucket" {
  type = string
}

variable "s3_bucket_arn" {
  type = string
}
variable "region" {
  type = string
}
