resource "aws_vpc" "vpc_wrk_main" {
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "vpc_workstation_main"
    }
}

resource "aws_subnet" "wrk_subnet" {
  vpc_id     = aws_vpc.vpc_wrk_main.id
  cidr_block = "10.0.0.0/28"

  tags = {
    Name = "Workstation subnet"
  }
}

resource "aws_internet_gateway" "wrk_gateway" {
    vpc_id = aws_vpc.vpc_wrk_main.id  
}

resource "aws_route_table" "wrk_route_table" {
  vpc_id = aws_vpc.vpc_wrk_main.id

  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wrk_gateway.id
  }
}

resource "aws_route_table_association" "wrk_rta" {
  subnet_id = aws_subnet.wrk_subnet.id
  route_table_id = aws_route_table.wrk_route_table.id
}