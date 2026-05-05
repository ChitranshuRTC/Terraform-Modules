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
variable "office_cidr" {
  description = "CIDR block for office IP to allow SSH access"
  type        = string
}
variable "egress_protocol" {
  description = "Protocol for egress rule (e.g., tcp, udp, -1 for all)"
  type        = string
  default     = "-1"
}
variable "ingress_protocol" {
  description = "Protocol for ingress rule (e.g., tcp, udp, -1 for all)"
  type        = string
  default     = "tcp"
}
variable "public_route_cidr" {
  description = "CIDR block for public route (e.g., 0.0.0.0/0)"
  type        = string
  default     = "0.0.0.0/0"
}

