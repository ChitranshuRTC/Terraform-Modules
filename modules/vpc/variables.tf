variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "availability_zone" {
  description = "AZ for subnet"
  type        = string
}
variable "vpc_name" {
  description = "VPC name"
  type        = string
}
variable "private_subnet_cidr" {
  type = string
}
variable "associate_public_ip" {
  type    = bool
  default = true
}
variable "public_route_cidr" {
  type    = string
  default = "0.0.0.0/0"
}