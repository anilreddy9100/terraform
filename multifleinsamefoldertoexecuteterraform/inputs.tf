variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "ask to user to set region were they need resource "
}
variable "my-vpc-range" {
  type        = string
  default     = "192.168.0.0/16"
  description = "ask user to set specfic range to create vpc"
}
variable "my_subnets" {
  type        = list(string)
  default     = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24","192.168.3.0/24"]
  description = "ask to user to cerate subnet range"
}
variable "myAZ" {
  type = list(string)
  default = [ "a", "b","a", "b" ]
  description = "ask user to use specfir AZ"
  
}

variable "tagname" {
  type = list(string)
  default = [ "app1","db1","app2","db2" ]
  description = "ask user to give env names"
  
}
