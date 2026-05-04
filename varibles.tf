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