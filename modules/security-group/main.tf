# Security Group Resource
resource "aws_security_group" "this" {
  name   = var.sg_name
  vpc_id = var.vpc_id

  tags = {
    Name = var.sg_name
  }
}

# Ingress Rule for SSH
resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = var.ssh_cidr
  from_port         = var.ssh_port
  to_port           = var.ssh_port
  ip_protocol       = "tcp"
}

#  Allow all outbound
resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}