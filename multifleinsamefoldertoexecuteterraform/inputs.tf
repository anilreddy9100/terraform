variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "ask to user to set region were they need resource "
}
//variable "my-vpc-range" {
//  type        = string
//  default     = "192.168.0.0/16"
//  description = "ask user to set specfic range to create vpc"
//}

// variable "myAZ" {
//  type        = list(string)
//  default     = ["a", "b", "a", "b"]
//  description = "ask user to use specfir AZ"

//}

# variable "tagname" {
# type        = list(string)
# default     = ["app1", "db1", "app2", "db2"]
#description = "ask user to give env names"

//}

variable "vpc-creaction-info" {
  type = object({
    vpc_cidr        = string
    subnet_azs      = list(string)
    subnet_names    = list(string)
    public_subnets  = list(string)
    private_subnets = list(string)
    db_subnets      = list(string)
    web1_subnet_ec2 = string
  })
  default = {
    subnet_azs      = ["a", "b", "a", "b"]
    subnet_names    = ["app1", "app2", "db1", "db2"]
    vpc_cidr        = "192.168.0.0/16"
    public_subnets  = []
    private_subnets = ["app1", "app2", "db1", "db2"]
    db_subnets      = ["db1", "db2"]
    web1_subnet_ec2 = ""
  }

}
