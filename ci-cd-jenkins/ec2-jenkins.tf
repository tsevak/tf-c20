resource "aws_instance" "test-instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "tf-aws"
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  vpc_security_group_ids = [aws_security_group.web_ssh_sg.id] #Interpolation to place variable value
  tags = {
    Name = "Jenkins "
  }

  user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo yum install java wget unzip git -y
sudo setenforce 0
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins awscli -y
sudo service jenkins start
sudo chkconfig jenkins on
wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
unzip terraform_0.12.24_linux_amd64.zip
mv terraform /usr/local/bin/
EOF
}
