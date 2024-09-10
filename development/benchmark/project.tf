resource "lxd_project" "this" {
  name = local.name
  # description = "Terraform provider example project"
  # config = {
  #   "features.storage.volumes" = true
  #   "features.images"          = true
  #   "features.profiles"        = true
  #   "features.storage.buckets" = true
  # }
}
