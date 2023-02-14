resource "aws_route_table" "myroutetable" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  

#   route {
#     ipv6_cidr_block        = "::/0"
#     egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
#   }

  tags = {
    Name = "myroutetable"
  }
}


resource "aws_route_table" "PrivateRouteTable" {
  vpc_id = aws_vpc.main.id
   tags = {
    Name = "myprivateroutetable"
  }
}


# resource "aws_route_table_association" "internet_gateway" {
#     gateway_id = aws_internet_gateway.gw.id
#     route_table_id = aws_route_table.myroutetable.id 
# }

resource "aws_route_table_association" "MySubnet_01" {

  depends_on = [
    aws_route_table.myroutetable,
    aws_subnet.main1
  ]
    route_table_id = aws_route_table.myroutetable.id
    subnet_id = aws_subnet.main1.id 
}

resource "aws_route_table_association" "MySubnet_02" {
    depends_on = [
    aws_route_table.myroutetable,
    aws_subnet.main2
  ]
    route_table_id = aws_route_table.myroutetable.id
    subnet_id = aws_subnet.main2.id 
}
resource "aws_route_table_association" "MySubnet_03" {
    depends_on = [
    aws_route_table.myroutetable,
    aws_subnet.main3
  ]
    route_table_id = aws_route_table.myroutetable.id
    subnet_id = aws_subnet.main3.id 
}

resource "aws_route_table_association" "MyPrivateSubnet_01" {
    depends_on = [
    aws_route_table.PrivateRouteTable,
    aws_subnet.mainprivate1
  ]
    route_table_id = aws_route_table.PrivateRouteTable.id
    subnet_id = aws_subnet.mainprivate1.id 
}
resource "aws_route_table_association" "MyPrivateSubnet_02" {
     depends_on = [
    aws_route_table.PrivateRouteTable,
    aws_subnet.mainprivate2
  ]
    route_table_id = aws_route_table.PrivateRouteTable.id
    subnet_id = aws_subnet.mainprivate2.id 
}
resource "aws_route_table_association" "MyPrivateSubnet_03" {
    depends_on = [
    aws_route_table.PrivateRouteTable,
    aws_subnet.mainprivate3
  ]
    route_table_id = aws_route_table.PrivateRouteTable.id
    subnet_id = aws_subnet.mainprivate3.id 
}