
resource "lxd_profile" "this" {
  name    = local.name
  project = var.project

  config = {
    "cloud-init.user-data"      = file("${path.module}/cloud-init/user-data.yaml")
    "cloud-init.network-config" = file("${path.module}/cloud-init/network-config.yaml")
  }
}
