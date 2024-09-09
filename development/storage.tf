resource "lxd_storage_pool" "zfs" {
  count   = 1
  project = lxd_project.this.name
  name    = "${local.name}-zfs-${count.index}"
  driver  = "zfs"
  source  = "/dev/nvme0n1"
}
