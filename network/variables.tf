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
  description = "first availability zone"
}

variable "az-2" {
  type        = string
  description = "second availability zone"
}

