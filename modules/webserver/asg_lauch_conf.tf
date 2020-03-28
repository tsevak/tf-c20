resource aws_launch_configuration "my-asg-launch-conf" {
  name            = "webserver-launch"
  image_id        = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.web_ssh_sg.id]
  key_name        = "tf-aws"

user_data = file("${path.module}/user-data.sh")
  
}
