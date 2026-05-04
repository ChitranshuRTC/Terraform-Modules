# EC2 Instance Outputs
output "instance_id" {
  value = aws_instance.my_instance.id
}

# Public IP Output
output "public_ip" {
  value = aws_instance.my_instance.public_ip
}