# variable for security group name
variable "sg_name" {
  type = string
}

# variable for VPC id
variable "vpc_id" {
  type = string
}

# variable for SSH CIDR block
variable "ssh_cidr" {
  description = "Office IP for SSH"
  type        = string
}

# variable for SSH port
variable "ssh_port" {
  description = "Port for SSH"
  type        = number
  default     = 22
}

# variable for egress rule protocol
variable "office_cidr" {
  description = "Office IP CIDR block"
  type        = string
}

# variable for egress rule protocol
variable "egress_protocol" {
  description = "Protocol for egress rule (e.g., tcp, udp, -1 for all)"
  type        = string
  default     = "-1"
}

# variable for ingress rule protocol
variable "ingress_protocol" {
  description = "Protocol for ingress rule (e.g., tcp, udp, -1 for all)"
  type        = string
  default     = "tcp"
}