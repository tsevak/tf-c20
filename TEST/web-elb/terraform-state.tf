terraform {
  backend s3 {
    encrypt = true
    bucket  = "terraform-state-2386"
    key     = "T-wel-elb/terraform.tfstate"
    region  = "ap-southeast-2"
    dynamodb_table = "tf-state-main"
  }
}