# variable for VPC CIDR block
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

# variable for public subnet CIDR block
variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

# variable for private subnet CIDR block
variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
}

# variable for availability zone
variable "availability_zone" {
  description = "AZ for subnet"
  type        = string
}

# variable for VPC name
variable "vpc_name" {
  description = "VPC name"
  type        = string
}

# variable for office public IP
variable "office_cidr" {
  type = string
}

# variable for associate public IP address with EC2 instance
variable "associate_public_ip" {
  type    = bool
  default = true
}

# variable for public route CIDR block
variable "public_route_cidr" {
  type    = string
  default = "0.0.0.0/0"
}