resource "lxd_network" "default" {
  name = "lxdbr0"
  type = "bridge"

  config = {
    "ipv4.address" = "10.221.42.1/24"
    "ipv4.nat"     = "true"
    "ipv6.address" = "fd42:75e2:e226:9686::1/64"
    "ipv6.nat"     = "true"
  }
}
