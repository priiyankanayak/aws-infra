resource "aws_vpc" "main" {
  cidr_block = var.MyVPC_cidr_block
  tags = {
    Name = "MyVPC"
  }
}