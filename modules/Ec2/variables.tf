# variables.tf for EC2 module
variable "instance_name" {
  description = "Name for the EC2 instance"
  type        = string
}

# Variable Definitions
variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

# variable for instance type
variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

# variable for subnet ID
variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}

# variable for security group ID
variable "security_group_id" {
  description = "Security group ID for the EC2 instance"
  type        = string
}

# variable for key pair name
variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

# variable for whether to associate public IP
variable "associate_public_ip" {
  description = "Whether to assign public IP"
  type        = bool
  default     = true
}
