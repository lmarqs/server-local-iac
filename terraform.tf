terraform {
  required_version = "~> 1.8"

  backend "remote" {
    organization = "lmarqs"

    workspaces {
      name = "server-local"
    }
  }

  required_providers {
    lxd = {
      source  = "terraform-lxd/lxd"
      version = "~> 2.3"
    }
  }
}