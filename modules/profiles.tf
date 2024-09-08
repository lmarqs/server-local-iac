resource "lxd_profile" "default" {
  name        = "default"
  description = "Default LXD profile"
  #   config = {
  #     "limits.cpu" = 2
  #   }

  device {
    name = "eth0"
    type = "nic"

    properties = {
      name    = "eth0"
      network = "lxdbr0"
    }
  }

  device {
    name = "root"
    type = "disk"

    properties = {
      pool = "default"
      path = "/"
    }
  }
}
