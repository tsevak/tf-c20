resource "aws_autoscaling_group" "my_asg" {
  launch_configuration = aws_launch_configuration.my-asg-launch-conf.id
  availability_zones   = var.azs
  load_balancers       = [aws_elb.web_elb.name]
  min_size             = 1
  max_size             = 6
  desired_capacity     = 2

  tag {
    key                 = "Name"
    value               = "tf-web-asg"
    propagate_at_launch = true
  }


}
