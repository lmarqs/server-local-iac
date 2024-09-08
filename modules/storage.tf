resource "lxd_storage_pool" "default" {
  name        = "default"
  description = "Default LXD storage pool"
  driver      = "dir"
}
