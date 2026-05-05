variable "sg_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "ssh_cidr" {
  description = "Office IP for SSH"
  type        = string
}
variable "ssh_port" {
  description = "Port for SSH"
  type        = number
  default     = 22
}
variable "office_cidr" {
  description = "Office IP CIDR block"
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