resource "lxd_cached_image" "jammy" {
  project       = lxd_project.this.name
  source_remote = "ubuntu"
  source_image  = "jammy/amd64"
}
