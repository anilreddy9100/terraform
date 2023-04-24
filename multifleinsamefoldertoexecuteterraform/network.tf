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

resource "aws_route_table" "privite" {
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
  route  {
    cidr_block = local.anywhere
    gateway_id= aws_internet_gateway.myvpcigw.id
  }
   depends_on = [
    aws_subnet.subnets
  ]
}

