resource "aws_vpc" "myvpc" {
  cidr_block = var.my-vpc-range
  tags = {
    Name = "myvpc"
  }
}

resource "aws_subnet" "app1" {
  cidr_block        = var.my_subnet1
  availability_zone = "${var.region}a"
  vpc_id            = aws_vpc.myvpc.id # implicit dependency
  tags = {
    Name = "app1"
  }
  depends_on = [
    aws_vpc.myvpc
  ]
}

resource "aws_subnet" "db1" {
  cidr_block        = var.my_dbsubnet1
  availability_zone = "${var.region}a"
  vpc_id            = aws_vpc.myvpc.id
  tags = {
    Name = "db1"
  }
  depends_on = [
    aws_vpc.myvpc
  ]

}

resource "aws_subnet" "app2" {
  cidr_block        = var.my_subnet2
  availability_zone = "${var.region}b"
  vpc_id            = aws_vpc.myvpc.id
  tags = {
    Name = "app2"
  }
  depends_on = [
    aws_vpc.myvpc
  ]

}

resource "aws_subnet" "db2" {
  cidr_block        = var.my_dbsubnet2
  availability_zone = "${var.region}b"
  vpc_id            = aws_vpc.myvpc.id
  tags = {
    Name = "db2"
  }
  depends_on = [
    aws_vpc.myvpc
  ]

}