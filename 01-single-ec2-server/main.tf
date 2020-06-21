terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "tf-singymingy"

    workspaces {
      name = "ec2-web"
    }
  }
}
