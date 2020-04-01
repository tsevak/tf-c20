resource "random_string" "password" {
  length  = 16
  special = true
}

resource "aws_db_instance" "db-pgsql" {
  allocated_storage   = 20
  storage_type        = "gp2"
  engine              = "postgres"
  engine_version      = "10.9"
  instance_class      = "db.t2.micro"
  name                = "app"
  username            = var.user
  password            = random_string.password.result
  skip_final_snapshot = true
}