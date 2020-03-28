output "elb_dns_name" {
  value = aws_elb.web_elb.dns_name
}
output "webserver-sg_id" {
  value = aws_security_group.web_ssh_sg.id
}
