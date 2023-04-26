output "database_edp" {
  value = aws_db_instance.dbinstance.endpoint
}
output "ami_ids" {
  value = data.aws_ami_ids.ubuntu_2204.ids[0]
}
output "web_id" {
    value = aws_instance.web_1.public_ip
  
}