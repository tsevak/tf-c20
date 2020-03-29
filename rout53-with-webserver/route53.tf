resource "aws_route53_zone" "private-zone" {
  name = "tf53.info"
}

resource "aws_route53_record" "webserver" {
  zone_id = aws_route53_zone.private-zone.zone_id
  name    = "web.tf53.info"
  type    = "A"
  ttl     = "100"
  records = [aws_instance.test-instance.private_ip]
}