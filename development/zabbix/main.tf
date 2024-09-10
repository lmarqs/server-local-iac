locals {
  name = basename(abspath(path.module))
}

module "macvlan" {
  source = "../../lib/lxd/macvlan"

  name      = "${local.name}-macvlan"
  project   = var.project
  addresses = var.addresses
}

module "cloudinit" {
  source = "../../lib/lxd/cloud-init"

  name    = "${local.name}-cloudinit"
  project = var.project

  user_data      = file("${path.module}/cloud-init/user-data.yaml")
  # network_config = file("${path.module}/cloud-init/network-config.yaml")

  network_config = yamlencode(module.macvlan.network_config)
}

module "zfs" {
  source = "../../lib/lxd/zfs"

  name    = "${local.name}-zfs"
  project = var.project
}

resource "lxd_instance" "this" {
  name    = local.name
  image   = var.image
  project = var.project

  profiles = [
    module.cloudinit.profile.name,
    module.macvlan.profile.name,
    module.zfs.profile.name,
  ]

  limits = {
    cpu = 4
  }
}
