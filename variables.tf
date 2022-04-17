variable "key_name" {
  description = "My Default SSH key"
  type        = string
  # default     = "ec2_test"
  default = "myKey"
}

variable "ami_id" {
  description = "AMI Ubuntu"
  type        = string
  default     = "ami-0d527b8c289b4af7f"
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
