locals {
  vpc_id     = aws_vpc.myvpc.id
  anywhere   = "0.0.0.0/0"
  mysql_port = 3306
  tcp        = "tcp"
  ssh_port = 22
  http_port = 80
  https_port = 443
}
