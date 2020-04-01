output "IP" {
  value = aws_db_instance.db-pgsql.address
}

output "pass" {
  value     = random_string.password.result
  sensitive = true
}
output "pub-ip" {
  value = aws_instance.webapp.public_ip
}

