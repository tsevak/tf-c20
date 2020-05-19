
resource "aws_instance" "test-instance" {
  ami           = data.aws_ami.web.id
  instance_type = "t2.micro"
  key_name      = "tf-aws"

  tags = {
    Name = "ec2-test-webserver"
  }
}


data "aws_ami" "web" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["packer-webserver-*"]
  }
}
