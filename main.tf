# Main Terraform Configuration
module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
  vpc_name            = var.vpc_name
}

# Security Group Module
module "security_group" {
  source   = "./modules/security-group"
  sg_name  = "my-sg"
  vpc_id   = module.vpc.vpc_id
  ssh_cidr = var.office_ip
  ssh_port = var.ssh_port
}

# EC2 Instance Module
module "ec2" {
  source              = "./modules/ec2"
  instance_name       = "my-ec2"
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  subnet_id           = module.vpc.public_subnet_id
  security_group_id   = module.security_group.security_group_id
  key_name            = var.key_name
  associate_public_ip = true
}

# Private EC2 Instance Module
module "ec2_private" {
  source              = "./modules/ec2"
  instance_name       = "private-ec2"
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  subnet_id           = module.vpc.private_subnet_id
  security_group_id   = module.security_group.security_group_id
  key_name            = var.key_name
  associate_public_ip = false
}