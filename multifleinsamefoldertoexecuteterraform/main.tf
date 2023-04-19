resource "aws_vpc" "myvpc" {
  cidr_block = var.my-vpc-range
  tags = {
    Name = "myvpc"
  }
}

resource "aws_subnet" "app1" {
  cidr_block        = var.my_subnet1
  availability_zone = "${var.region}a"
  vpc_id            = aws_vpc.myvpc.id
}

resource "aws_subnet" "db1" {
  cidr_block        = var.my_dbsubnet1
  availability_zone = "${var.region}a"
  vpc_id            = aws_vpc.myvpc.id

}

resource "aws_subnet" "app2" {
  cidr_block        = var.my_subnet2
  availability_zone = "${var.region}b"
  vpc_id            = aws_vpc.myvpc.id

}

resource "aws_subnet" "db2" {
  cidr_block        = var.my_dbsubnet2
  availability_zone = "${var.region}b"
  vpc_id            = aws_vpc.myvpc.id

}