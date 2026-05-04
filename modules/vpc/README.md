# Final architecture
Internet
   ↓
IGW
   ↓
Public Subnet
   ↓
NAT Gateway
   ↓
Private Subnet
   ↓
Private EC2

# What you already have

You already built:

✔ VPC
✔ Public Subnet
✔ IGW
✔ Public Route Table
✔ Security Group
✔ EC2 (public)


# What we are adding now
➕ Private Subnet
➕ NAT Gateway
➕ Elastic IP
➕ Private Route Table
➕ Private EC2

Modify your EXISTING VPC module

Go to:

modules/vpc/main.tf
✅ ADD: Private Subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.vpc_name}-private-subnet"
  }
}
✅ ADD: Elastic IP
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "nat-eip"
  }
}
✅ ADD: NAT Gateway
resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id   # MUST be public

  tags = {
    Name = "nat-gateway"
  }
}
✅ ADD: Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.vpc_name}-private-rt"
  }
}
✅ ADD: Route → NAT
resource "aws_route" "private_internet" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
}
✅ ADD: Association
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
✅ ADD OUTPUT
output "private_subnet_id" {
  value = aws_subnet.private.id
}
🔗 4. KEEP your public route table as-is

Already correct:

0.0.0.0/0 → IGW
🧩 5. Update EC2 module (small change)

Go to:

modules/ec2/main.tf
✅ Add this (important for private EC2)
associate_public_ip_address = var.associate_public_ip
✅ variables.tf
variable "associate_public_ip" {
  type    = bool
  default = true
}
🧩 6. ROOT main.tf (MOST IMPORTANT PART)

This is where everything connects.

✅ Public EC2
module "ec2_public" {
  source = "./modules/ec2"

  instance_name     = "public-ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.security_group.security_group_id
  key_name          = var.key_name

  associate_public_ip = true
}
✅ Private EC2
module "ec2_private" {
  source = "./modules/ec2"

  instance_name     = "private-ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.vpc.private_subnet_id
  security_group_id = module.security_group.security_group_id
  key_name          = var.key_name

  associate_public_ip = false
}