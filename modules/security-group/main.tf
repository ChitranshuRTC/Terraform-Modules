# Resource for Security Group
resource "aws_security_group" "security_group" {
  name   = var.sg_name
  vpc_id = var.vpc_id

  tags = {
    Name = var.sg_name
  }
}

#  Allow only SSH from office IP
resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = var.ssh_cidr
  from_port         = var.ssh_port
  to_port           = var.ssh_port
  ip_protocol       = var.ingress_protocol # tcp
}

#  Allow all outbound traffic to office IP
resource "aws_vpc_security_group_egress_rule" "all_outbound" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = var.office_cidr
  ip_protocol       = var.egress_protocol
}