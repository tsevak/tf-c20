resource aws_launch_configuration "my-asg-launch-conf" {
  name            = "webserver-launch"
  image_id        = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.web_ssh_sgs.id]
  key_name        = "tf-aws"

  user_data = <<-EOF
      #!/bin/bash
      sudo yum update -y all
      sudo yum install -y httpd
      sudo systemctl start httpd
      sudo systemctl enable htpd
      instance_ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
      sudo echo $instance_ip > /var/www/html/index.html
EOF
}
