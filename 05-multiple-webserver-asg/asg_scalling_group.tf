resource "aws_autoscaling_group" "my_asg" {
  launch_configuration = aws_launch_configuration.my-asg-launch-conf.id
  availability_zones   = var.azs

  min_size         = 2
  max_size         = 6
  desired_capacity = 3

  tag {
    key                 = "Name"
    value               = "tf-web-asg"
    propagate_at_launch = true
  }


}
