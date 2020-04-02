variable "region" {
  default = "ap-southeast-2"
}
variable "http_port" {
  default = 80
}
variable "ssh_port" {
  default = 22
}
variable "myip" {
  default = "118.149.67.158/32"
}

variable "ami" {
  default = "ami-08fdde86b93accf1c"
}


variable "instance_type" {
  default = "t2.micro"
}

variable "azs" {
  default = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
}
variable "access_key" {
  default = "tf-aws"
}

variable "user" {
  default = "postgres"
}
