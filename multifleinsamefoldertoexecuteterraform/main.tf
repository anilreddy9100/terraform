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
  vpc_id            = aws_vpc.myvpc.id # implicit dependency
  tags = {
    Name = var.vpc-creaction-info.subnet_names[count.index]
  }
  depends_on = [
    aws_vpc.myvpc
  ]
}
