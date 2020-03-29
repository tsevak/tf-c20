resource "aws_ebs_volume" "extra-ebs" {
  availability_zone = "ap-southeast-2a"
  size              = 10
  type              = "gp2"
  tags = {
    Name = "data"
  }
}
resource "aws_volume_attachment" "extra-ebs-attach" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.extra-ebs.id
  instance_id = module.ec2.ec2_id
}

