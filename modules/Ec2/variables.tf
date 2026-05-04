variable "instance_name" {
  type = string
}

variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}
variable "associate_public_ip" {
  description = "Whether to assign public IP"
  type        = bool
  default     = true
}