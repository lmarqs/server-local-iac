resource "lxd_profile" "macvlan" {
  name    = "macvlan"
  project = lxd_project.this.name

  device {
    name = "eth0"
    type = "nic"

    properties = {
      name    = "eth0"
      nictype = "macvlan"
      parent  = local.physical_network
    }
  }
}

resource "lxd_profile" "zfs" {
  name    = "zfs"
  project = lxd_project.this.name

  device {
    name = "root"
    type = "disk"

    properties = {
      pool = lxd_storage_pool.zfs[0].name
      path = "/"
    }
  }
}

