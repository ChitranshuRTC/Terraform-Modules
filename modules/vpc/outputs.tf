# VPC Outputs
output "vpc_id" {
  value = aws_vpc.vpc.id
}

# Subnet Outputs
output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

# Internet Gateway Output
output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}