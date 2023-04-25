resource "aws_security_group" "dbsegp" {
  name = "mysqldb"
  ingress {
    from_port   = local.mysql_port
    to_port     = local.mysql_port
    cidr_blocks = [var.vpc-creaction-info.vpc_cidr]
    protocol    = local.tcp
  }
  tags = {
    "name" = "mysql"
  }

}