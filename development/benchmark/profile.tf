resource "lxd_profile" "default" {
  name    = "default"
  project = lxd_project.this.name

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
      pool = "nvme0n1"
      path = "/"
    }
  }
}
