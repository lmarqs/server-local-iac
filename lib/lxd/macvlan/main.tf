variable "name" {
  description = "The resources name"
  type        = string
}

variable "project" {
  description = "The project to create the resources in"
  type        = string
  default     = null
}

variable "parent" {
  description = "The physical network interface to use for the macvlan"
  type        = string
  default     = "enp6s0"
}

variable "addresses" {
  description = "The IP address to assign to the macvlan"
  type        = list(number)
  default     = []
}

resource "lxd_profile" "this" {
  name    = var.name
  project = var.project

  device {
    name = "eth0"
    type = "nic"

    properties = {
      name    = "eth0"
      nictype = "macvlan"
      parent  = var.parent
    }
  }
}

output "profile" {
  value = lxd_profile.this
}

output "network_config" {
  value = {
    network = {
      version  = 2
      renderer = "networkd"
      ethernets = {
        eth0 = {
          dhcp4     = "no"
          addresses = [for address in var.addresses : "${cidrhost("192.168.1.0/24", address + 121)}/24"]
          gateway4  = "192.168.1.254"
          nameservers = {
            addresses = [
              "192.168.1.254",
              "8.8.8.8",
              "8.8.4.4",
            ]
          }
        }
      }
    }
  }
}

terraform {
  required_providers {
    lxd = {
      source = "terraform-lxd/lxd"
    }
  }
}
