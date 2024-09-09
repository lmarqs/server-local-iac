resource "lxd_instance" "this" {
  name    = local.name
  image   = var.image
  project = var.project

  profiles = concat(
    var.profiles,
    [lxd_profile.this.name],
  )

  limits = {
    cpu = 1
  }
}
