terraform {
  backend "remote" {
    hostname      = "app.terraform.io"
    organization  = "XXX"

    workspaces {
      name = "XXX"
    }
  }
}
