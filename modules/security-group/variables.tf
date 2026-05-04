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