terraform {
  required_version = "~> 1.8"
  
  required_providers {
    lxd = {
      source = "terraform-lxd/lxd"
      version = "~> 2.3"
    }
  }
}