# Variable Definitions
variable "vpc_cidr" {}
variable "public_subnet_cidr" {}
variable "availability_zone" {}
variable "vpc_name" {}
variable "office_ip" {
  description = "Your office public IP"
  type        = string
}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "private_subnet_cidr" {}
variable "ssh_port" {
  description = "Port number for SSH access in the security group"
  type        = number
}