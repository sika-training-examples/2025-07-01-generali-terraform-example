resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.name
  }
}

resource "aws_subnet" "this" {
  count = length(var.subnets)

  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.subnets[count.index].cidr_block
  availability_zone       = var.subnets[count.index].availability_zone
  map_public_ip_on_launch = true
  tags                    = { Name = "${var.name}-subnet-${count.index}" }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
  tags   = { Name = "${var.name}-igw" }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.name}-rtb"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta" {
  count = length(var.subnets)

  subnet_id      = aws_subnet.this[count.index].id
  route_table_id = aws_route_table.rt.id
}
