terraform {
  required_version = ">= 0.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.4"
    }
  }
}

provider "aws" {
  region = local.region
}

locals {
  region = "us-east-1"
  vpc = {
    name  = "vpc_aclavijo"
    cidr  = "192.168.0.0/20"
    az    = "us-east-1a"
    sg    = {
      name        = "vpc_sg_aclavijo"
      description = "Security Group"
    }
    # Subnets CIDR Blocks
    subnets = { 
      private = "192.168.0.0/23"
      public  = "192.168.2.192/27"
    }
  }

  ec2 = { # Instance variables
    name          = "ec2_aclavijo"
    instance_type = "t2.micro"
    associate_public_ip_address = true
    filter = {
      most_recent   = true
      owners        = ["amazon"]
      values        = ["amzn-ami-hvm-*-x86_64-gp2"]
    }
  }
  key_pair = {
    name = "key_pair_aclavijo"
    algorithm = "RSA"
    secret_name = "secret_aclavijo"
  }
}
module "key_pair_secret" {
  source = "./modules/key_pair"
  private_key_algorithm = local.key_pair.algorithm
  key_name = local.key_pair.name
  secret_name = local.key_pair.secret_name
  resource_specific_tags = var.resource_specific_tags
}
module "vpc_routable" {
  source = "./modules/vpc"
  vpc_cidr_block = local.vpc.cidr
  public_subnet_cidr = local.vpc.subnets.public
  availability_zone = local.vpc.az
  private_subnet_cidr = local.vpc.subnets.private
  security_group_name = local.vpc.sg.name
  resource_specific_tags = var.resource_specific_tags
}
module "ec2_instance" {
  source = "./modules/ec2"
  most_recent     = local.ec2.filter.most_recent
  owners          = local.ec2.filter.owners
  filter_instance_values = local.ec2.filter.values
  instance_type   = local.ec2.instance_type
  key_pair_name   = module.key_pair_secret.key_pair_name
  instance_name   = local.ec2.name
  aws_subnet_id   = module.vpc_routable.public_subnet_id
  aws_security_group_id = [module.vpc_routable.security_group_id]
  associate_public_ip_address = local.ec2.associate_public_ip_address
  resource_specific_tags = var.resource_specific_tags
}

