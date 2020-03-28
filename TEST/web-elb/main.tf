module "webserver" {
  source = "../../modules/webserver"

}
resource "aws_security_group_rule" "allow_db_port" {
  type              = "ingress"
  security_group_id = module.webserver.webserver-sg_id
  from_port         = 1521
  to_port           = 1521
  protocol          = "tcp"
  cidr_blocks       = ["118.149.67.158/32"]
}