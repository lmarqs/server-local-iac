resource "lxd_storage_pool" "this" {
  name   = "zfs"
  driver = "zfs"
  source = "/dev/nvme0n1"
}
