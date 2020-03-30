resource "aws_security_group" "web_ssh_sgs" {
  name        = "allow_web_sshg"
  description = "Allow web traffic from internet and ssh from myIP"

  ingress {
    description = "port 80 from internet"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "port 22 from myIP"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = [var.myip]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-ssh-sg"
  }
}