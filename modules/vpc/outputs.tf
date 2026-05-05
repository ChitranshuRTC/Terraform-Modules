# output for VPC id
output "vpc_id" {
  value = aws_vpc.vpc.id
}

# output for public subnet id
output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

# output for availability zone
output "availability_zone" {
  value = aws_subnet.public_subnet.availability_zone
}

# output for private subnet id
output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}