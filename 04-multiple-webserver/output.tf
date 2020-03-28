output "web_pub_ip" {
  value = [aws_instance.test-instance.*.public_ip]
}
