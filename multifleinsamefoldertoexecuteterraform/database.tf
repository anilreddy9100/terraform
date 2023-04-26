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
  vpc_id = local.vpc_id
  depends_on = [
    aws_subnet.subnets
  ]

}

data "aws_subnets" "dbsubnet" {
  filter {
    name   = "tag:NAME"
    values = var.vpc-creaction-info.db_subnets
  }
  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }
  depends_on = [
    aws_subnet.subnets
  ]
}
resource "aws_db_subnet_group" "dbsbgp" {
  name       = "dbsbgp"
  subnet_ids = data.aws_subnets.dbsubnet.ids
  depends_on = [
    aws_subnet.subnets
  ]

}

resource "aws_db_instance" "dbinstance" {
  allocated_storage      = 20
  db_name                = "myemployee"
  db_subnet_group_name   = "dbsbgp"
  engine                 = "mysql"
  engine_version         = "8.0.28"
  instance_class         = "db.t2.micro"
  password               = "rootroot"
  username               = "database"
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.dbsegp.id]
  skip_final_snapshot    = true
  depends_on = [
    aws_db_subnet_group.dbsbgp,
    aws_security_group.dbsegp
  ]
}