resource "aws_vpc" "myvpc" {
  cidr_block = var.my-vpc-range
  tags = {
    Name = "myvpc"
  }
}

resource "aws_subnet" "subnets" {
  count             = length(var.tagname)
  cidr_block        = cidrsubnet(var.my-vpc-range, 8, count.index)
  availability_zone = "${var.region}${var.myAZ[count.index]}"
  vpc_id            = aws_vpc.myvpc.id # implicit dependency
  tags = {
    Name = var.tagname[count.index]
  }
  depends_on = [
    aws_vpc.myvpc
  ]
}
