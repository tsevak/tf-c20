data "template_file" "instance_user_data" {
  template = "${file("a.sh.tpl")}"

  vars = {
    some_address = aws_db_instance.db-pgsql.address
    some_rendom  = data.vault_generic_secret.rds_passwd.data["data"]
  }
}

resource "aws_instance" "webapp" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.access_key

  tags = {
    Name = "webapp"
  }
  user_data = <<-EOF
#!/bin/bash -xe
exec > >(tee /var/log/user-data.log | logger -t user-data -s 2>/dev/console) 2>&1
cd /opt
wget https://github.com/servian/TechTestApp/releases/download/v.0.5.0/TechTestApp_v.0.5.0_linux64.zip
unzip TechTestApp_v.0.5.0_linux64.zip

export VTT_LISTENPORT=80
export VTT_DBHOST="${aws_db_instance.db-pgsql.address}" 

export VTT_DBPASSWORD="${data.vault_generic_secret.rds_passwd.data["data"]}" 
export VTT_LISTENHOST=0.0.0.0

cd /opt/dist/
./TechTestApp updatedb -s
./TechTestApp serve &
EOF

}
