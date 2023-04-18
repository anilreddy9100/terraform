provider "aws" {
  region     = "us-west-2"
  access_key = "user-asses-key"
  secret_key = "user-secret-token"
}
but it is not good idea to give asseskey secret_key
terraform can configure acceskey secret key from our server 
authentication 