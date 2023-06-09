resource "aws_security_group" "web" {
  name = "web"
  ingress {
    from_port   = local.ssh_port
    to_port     = local.ssh_port
    cidr_blocks = [local.anywhere]
    protocol    = local.tcp
  }
  ingress {
    from_port   = local.http_port
    to_port     = local.http_port
    cidr_blocks = [local.anywhere]
    protocol    = local.tcp
  }
  tags = {
    "name" = "web1"
  }
  vpc_id = local.vpc_id
  depends_on = [
    aws_subnet.subnets
  ]

}
data "aws_ami_ids" "ubuntu_2204" {
  owners = ["099720109477"]
  filter {
    name   = "description"
    values = ["Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-03-25"]
  }
  filter {
    name   = "is-public"
    values = ["true"]
  }

}
data "aws_subnet" "web1sub_id" {
  vpc_id = local.vpc_id
  filter {
    name   = "tag:Name"
    values = [var.vpc-creaction-info.web1_subnet_ec2]
  }
  depends_on = [
    aws_subnet.subnets
  ]

}

resource "aws_instance" "web_1" {
  ami =                        local.ami_id
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  subnet_id                   = data.aws_subnet.web1sub_id.id
  vpc_security_group_ids      = [aws_security_group.web.id]
  tags = {
    name = "web1"
  }
  depends_on = [
    aws_db_instance.dbinstance,
    aws_security_group.web
  ]

}

