module "webserver" {
  source = "git::https://github.com/tej4pnfr/tf-c20.git//modules/webserver?ref=1.0"
  ami = "ami-0b2045146eb00b617"
}
resource "aws_security_group_rule" "allow_db_port" {
  type              = "ingress"
  security_group_id = module.webserver.webserver-sg_id
  from_port         = 1521
  to_port           = 1521
  protocol          = "tcp"
  cidr_blocks       = ["118.149.67.158/32"]
}