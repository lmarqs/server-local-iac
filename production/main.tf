locals {
  name = basename(abspath(path.module))
}

resource "lxd_project" "this" {
  name = local.name
}

resource "lxd_cached_image" "jammy" {
  project       = lxd_project.this.name
  source_remote = "ubuntu"
  source_image  = "jammy/amd64"
}

resource "lxd_storage_pool" "zfs" {
  project = lxd_project.this.name
  name    = "${local.name}-zfs"
  driver  = "zfs"
  source  = "/dev/mapper/vg0-lxd--zfs--${local.name}"
}
