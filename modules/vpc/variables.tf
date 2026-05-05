# VPC Variables
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

# Subnet Variables
variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

# Subnet Variables
variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
}

# Availability Zone Variable
variable "availability_zone" {
  description = "AZ for subnet"
  type        = string
}

# VPC Name Variable
variable "vpc_name" {
  description = "VPC name"
  type        = string
}

# Route Variables
variable "office_cidr" {
  type = string
}

# Office IP Variable
variable "associate_public_ip" {
  type    = bool
  default = true
}

# Route Variables
variable "public_route_cidr" {
  type    = string
  default = "0.0.0.0/0"
}