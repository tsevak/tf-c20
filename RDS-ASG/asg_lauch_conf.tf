data "template_file" "int" {
  template = "${file("a.sh.tpl")}"

  vars = {
    some_address = aws_db_instance.db-pgsql.address
    some_rendom  = random_string.password.result
  }
}

resource aws_launch_configuration "my-asg-launch-conf" {

  key_name        = var.access_key
  name            = "webserver-launch"
  image_id        = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.web_ssh_sg.id]


  user_data = <<-EOF
#!/bin/bash -xe
exec > >(tee /var/log/user-data.log | logger -t user-data -s 2>/dev/console) 2>&1
cd /opt
wget https://github.com/servian/TechTestApp/releases/download/v.0.5.0/TechTestApp_v.0.5.0_linux64.zip
unzip TechTestApp_v.0.5.0_linux64.zip

export VTT_LISTENPORT=80
export VTT_DBHOST="${aws_db_instance.db-pgsql.address}" 
export VTT_DBPASSWORD="${random_string.password.result}" 
export VTT_LISTENHOST=0.0.0.0

cd /opt/dist/
./TechTestApp updatedb -s
./TechTestApp serve &
EOF
}
