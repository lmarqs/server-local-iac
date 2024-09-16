# module "dev-tools" {
#   source = "./dev-tools"

#   project = lxd_project.this.name
#   images  = lxd_cached_image.jammy.fingerprint

#   addresses = [2]
# }

module "grafana" {
  source = "./grafana"

  project      = lxd_project.this.name
  image        = lxd_cached_image.jammy.fingerprint
  storage_pool = lxd_storage_pool.zfs.name
  addresses    = [1]
}

module "zabbix" {
  source = "./zabbix"

  project      = lxd_project.this.name
  image        = lxd_cached_image.jammy.fingerprint
  storage_pool = lxd_storage_pool.zfs.name
  addresses    = [0]
}
