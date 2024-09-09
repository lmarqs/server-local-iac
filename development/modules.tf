module "zabbix" {
  source = "./zabbix"

  project = lxd_project.this.name
  image   = lxd_cached_image.jammy.fingerprint

  profiles = [
    lxd_profile.macvlan.name,
    lxd_profile.zfs.name,
  ]
}
