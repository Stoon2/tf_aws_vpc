provider "aws" {
  # Configuration options
  profile = "default"
  region  = "eu-central-1"
}

module "network" {
  source         = "./network"
  vpc_main_cidr  = var.vpc_main_cidr
  pub_sn_1_cidr  = var.pub_sn_1_cidr
  pub_sn_2_cidr  = var.pub_sn_2_cidr
  priv_sn_1_cidr = var.priv_sn_1_cidr
  priv_sn_2_cidr = var.priv_sn_2_cidr
  az-1           = var.az-1
  az-2           = var.az-2
}
