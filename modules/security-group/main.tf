# resource to Create Security Group
resource "aws_security_group" "security_group" {
  name   = var.sg_name
  vpc_id = var.vpc_id
  tags = {
    Name = var.sg_name
  }
}

# resource to create security group ingress rules ipv4
resource "aws_vpc_security_group_ingress_rule" "ingress_rule_allow_cidr4_ipv4" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = var.ssh_cidr
  from_port         = var.ssh_port
  to_port           = var.ssh_port
  ip_protocol       = var.ingress_protocol
}

# resource to create security group egress rules ipv4
resource "aws_vpc_security_group_egress_rule" "egress_rule_allow_cidr4_ipv4" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = var.office_cidr
  ip_protocol       = var.egress_protocol
}