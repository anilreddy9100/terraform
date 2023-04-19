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
variable "my_subnet1" {
  type        = string
  default     = "192.168.0.0/24"
  description = "ask to user to cerate subnet range"
}
variable "my_subnet2" {
  type        = string
  default     = "192.168.1.0/24"
  description = "ask to user to cerate subnet range"
}
variable "my_dbsubnet1" {
  type        = string
  default     = "192.168.0.0/24"
  description = "ask to user to cerate subnet range"
}
variable "my_dbsubnet2" {
  type        = string
  default     = "192.168.3.0/24"
  description = "ask to user to cerate subnet range"
}
