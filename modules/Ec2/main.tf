# resource to Create EC2 Instance
resource "aws_instance" "ec2_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.key_name
  tags = {
    Name = var.instance_name
  }
}