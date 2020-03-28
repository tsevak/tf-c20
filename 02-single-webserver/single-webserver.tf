resource "aws_instance" "test-instance" {
  ami                    = "ami-0c1b84cdd84eb5201"
  instance_type          = "t2.micro"
  key_name               = "tf-aws"
  vpc_security_group_ids = ["${aws_security_group.web_ssh_sg.id}"] #Interpolation to place variable value
  tags = {
    Name = "webserver-test1"
  }

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