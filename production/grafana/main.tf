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
  network_config = yamlencode(module.macvlan.network_config)
}

module "zfs" {
  source = "../../lib/lxd/zfs"

  name         = "${local.name}-zfs"
  project      = var.project
  storage_pool = var.storage_pool
}

resource "lxd_instance" "this" {
  name    = local.name
  image   = var.image
  project = var.project

  profiles = [
    module.cloudinit.profile.name,
    module.macvlan.profile.name,
    module.zfs.profile.name,
    # lxd_profile.data.name,
  ]

  limits = {
    cpu = 4
  }
}


resource "lxd_profile" "data" {
  name    = "${local.name}-data"
  project = var.project

  device {
    name = "data"
    type = "disk"

    properties = {
      source = "/tmp/grafana"
      path   = "/var/lib/grafana"
    }
  }
}


# GF_PATHS_CONFIG	/etc/grafana/grafana.ini
# GF_PATHS_DATA	/var/lib/grafana
# GF_PATHS_HOME	/usr/share/grafana
# GF_PATHS_LOGS	/var/log/grafana
# GF_PATHS_PLUGINS	/var/lib/grafana/plugins
# GF_PATHS_PROVISIONING	/etc/grafana/provisioning
