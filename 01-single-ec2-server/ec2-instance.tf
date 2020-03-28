resource "aws_instance" "test-instance" {
  ami           = "ami-0c1b84cdd84eb5201"
  instance_type = "t2.micro"
  key_name      = "tf-aws"

 tags = {
	 Name = "ec2-test-centos7"
 }
}