resource "lxd_storage_pool" "default" {
  name   = "default"
  driver = "dir"
}

resource "lxd_storage_pool" "nvme0n1" {
  name   = "nvme0n1"
  driver = "zfs"
  source = "/dev/nvme0n1"
}
