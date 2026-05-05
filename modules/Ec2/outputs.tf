# ec2 outputs 
output "instance_id" {
  value = aws_instance.ec2_instance.id
}

# public ip output
output "public_ip" {
  value = aws_instance.ec2_instance.public_ip
}