resource "aws_subnet" "mainprivate1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.MyPSubnet1_cidr_block
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "MyPrivateSubnet_01"
  }
}

resource "aws_subnet" "mainprivate2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.MyPSubnet2_cidr_block
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "MyPrivateSubnet_02"
  }
}

resource "aws_subnet" "mainprivate3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.MyPSubnet3_cidr_block
  availability_zone = data.aws_availability_zones.available.names[2]

  tags = {
    Name = "MyPrivateSubnet_03"
  }
}