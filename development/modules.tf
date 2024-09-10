module "grafana" {
  source = "./grafana"

  project = lxd_project.this.name
  image   = lxd_cached_image.jammy.fingerprint

  addresses = [1]
}

module "zabbix" {
  source = "./zabbix"

  project = lxd_project.this.name
  image   = lxd_cached_image.jammy.fingerprint

  addresses = [0]
}
