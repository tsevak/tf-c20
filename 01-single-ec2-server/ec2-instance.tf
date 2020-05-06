resource "aws_instance" "test-instance" {
  ami           = "ami-0b2045146eb00b617"
  instance_type = "t2.micro"
  key_name      = "tf-aws"

  tags = {
    Name = "ec2-test-centos7"
  }
}