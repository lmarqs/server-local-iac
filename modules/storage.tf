resource "lxd_storage_pool" "default" {
  name   = "default"
  driver = "dir"
}

resource "lxd_storage_pool" "zfs" {
  name   = "lcx"
  driver = "zfs"
  source = "/dev/nvme0n1"
}
