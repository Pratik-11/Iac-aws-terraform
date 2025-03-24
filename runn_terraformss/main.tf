terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

module "vpc1" {
  source = "/home/pratiksingh/terraform-iac/modules/vpc"
  vpc_cidr_block = var.vpc1_cidr_block
  public_subnets_cidrs = var.vpc1_public_subnets
  private_subnets_cidrs = var.vpc1_private_subnets
  azs = var.azs
}


module "vpc2" {
  source = "/home/pratiksingh/terraform-iac/modules/vpc"
  vpc_cidr_block = var.vpc2_cidr_block
  public_subnets_cidrs = var.vpc2_public_subnets
  private_subnets_cidrs = var.vpc2_private_subnets
  azs = var.azs
}


module "ec2_1" {
  source= "/home/pratiksingh/terraform-iac/modules/ec2"
  instance_type = var.instance_type
  ami = var.ami
  key_name = var.key_name
  # private_subnet = module.vpc1.private_subnet_id
  # public_subnet = module.vpc1.public_subnet_id
  subnet_id = var.use_private_subnet ? module.vpc1.private_subnet_id : module.vpc1.public_subnet_id
  use_private_subnet = true
  vpc = module.vpc1.vpc_id
}


module "ec2_2" {
  source = "/home/pratiksingh/terraform-iac/modules/ec2"
  instance_type = var.instance_type
  ami = var.ami
  key_name = var.key_name
  # private_subnet = module.vpc2.private_subnet_id
  # public_subnet = module.vpc2.public_subnet_id
  subnet_id = var.use_private_subnet ? module.vpc2.private_subnet_id : module.vpc2.public_subnet_id 
  # use_private_subnet = true
  vpc = module.vpc2.vpc_id
}

module "vpc_peering" {
  source = "/home/pratiksingh/terraform-iac/modules/vpc_peering"
  vpc1_id = module.vpc1.vpc_id
  vpc2_id = module.vpc2.vpc_id
  vpc1_cidr_block = var.vpc1_cidr_block
  vpc2_cidr_block = var.vpc2_cidr_block
  vpc1_route_table_id = module.vpc1.private_route_table_id
  vpc2_route_table_id = module.vpc2.private_route_table_id
}