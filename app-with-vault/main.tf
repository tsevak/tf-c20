provider "vault" {
  address = "http://127.0.0.1:8200"
}

data "vault_generic_secret" "rds_passwd" {
  path = "tf/rds_passwd"
}


resource "aws_db_instance" "db-pgsql" {
  allocated_storage   = 20
  storage_type        = "gp2"
  engine              = "postgres"
  engine_version      = "10.9"
  instance_class      = "db.t2.micro"
  name                = "app"
  username            = var.user
  password            = data.vault_generic_secret.rds_passwd.data["data"]
  skip_final_snapshot = true
}