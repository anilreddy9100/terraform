locals {
  vpc_id   = aws_vpc.myvpc.id
  anywhere = "0.0.0.0/0"
}