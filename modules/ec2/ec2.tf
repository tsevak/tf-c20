resource "aws_instance" "test-instance" {
  ami           = "ami-0b2045146eb00b617"    # centos 7
  instance_type = var.instance_type
  key_name      = "tf-aws"
  availability_zone = var.az 

 tags = {
	 Name = "ec2-test-centos7"
 }
}