resource "aws_subnet" "main1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.MySubnet1_cidr_block
  availability_zone = data.aws_availability_zones.available.names[0]

  map_public_ip_on_launch = true
  tags = {
    Name = "MySubnet_01"
  }
}

resource "aws_subnet" "main2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.MySubnet2_cidr_block
  availability_zone = data.aws_availability_zones.available.names[1]

  map_public_ip_on_launch = true

  tags = {
    Name = "MySubnet_02"
  }
}

resource "aws_subnet" "main3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.MySubnet3_cidr_block
  availability_zone = data.aws_availability_zones.available.names[2]
  
  map_public_ip_on_launch = true

  tags = {
    Name = "MySubnet_03"
  }
}