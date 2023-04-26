resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc-creaction-info.vpc_cidr
  tags = {
    Name = "myvpc"
  }
}

resource "aws_subnet" "subnets" {
  count             = length(var.vpc-creaction-info.subnet_names)
  cidr_block        = cidrsubnet(var.vpc-creaction-info.vpc_cidr, 8, count.index)
  availability_zone = "${var.region}${var.vpc-creaction-info.subnet_azs[count.index]}"
  vpc_id            = local.vpc_id # implicit dependency
  tags = {
    Name = var.vpc-creaction-info.subnet_names[count.index]
  }
  depends_on = [
    aws_vpc.myvpc
  ]
}

resource "aws_internet_gateway" "myvpcigw" {
  vpc_id = local.vpc_id
  tags = {
    name = "my-igw"
  }
  depends_on = [
    aws_vpc.myvpc
  ]
}

resource "aws_route_table" "private" {
  vpc_id = local.vpc_id
  tags = {
    name = "myroutepv"
  }
  depends_on = [
    aws_subnet.subnets
  ]
}
resource "aws_route_table" "public" {
  vpc_id = local.vpc_id
  tags = {
    name = "public"
  }
  route {
    cidr_block = local.anywhere
    gateway_id = aws_internet_gateway.myvpcigw.id
  }
  depends_on = [
    aws_subnet.subnets
  ]
}
data "aws_subnets" "public1" {
  filter {
    name   = "tag:Name"
    values = var.vpc-creaction-info.public_subnets
  }
  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }
  depends_on = [
    aws_subnet.subnets
  ]

}
data "aws_subnets" "private1" {
  filter {
    name   = "tag:Name"
    values = var.vpc-creaction-info.private_subnets
  }
  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }
  depends_on = [
    aws_subnet.subnets
  ]

}
// first create subnets then subnets apply after creaction add resource aws_route_table_associction
resource "aws_route_table_association" "public_associations" {
  count          = length(data.aws_subnets.public1.ids)
  route_table_id = aws_route_table.public.id
  subnet_id      = data.aws_subnets.public1.ids[count.index]

}

resource "aws_route_table_association" "private_associations" {
  count          = length(data.aws_subnets.private1.ids)
  route_table_id = aws_route_table.private.id
  subnet_id      = data.aws_subnets.private1.ids[count.index]

}



