region = "us-east-1"
#my-vpc-range = "10.10.0.0/16"
# my_subnets   = ["10.10.0.0/24","10.10.1.0/24","10.10.2.0/24","10.10.3.0/24"]
# myAZ    = ["a", "b", "a", "b"]
# tagname = ["app1", "db1", "app2", "db2"]
vpc-creaction-info = {
  subnet_azs      = ["a", "b", "a", "b", "a", "b"]
  subnet_names    = ["app1", "app2", "db1", "db2", "web1", "web2"]
  vpc_cidr        = "10.10.0.0/16"
  public_subnets  = ["web1","web2"]
  private_subnets = ["app1", "app2", "db1", "db2"]
  db_subnets      = ["db1", "db2"]
  web1_subnet_ec2 = "web1"
}