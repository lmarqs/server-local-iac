# resource "lxd_storage_pool" "default" {
#   name   = "default"
#   driver = "dir"
# }

# resource "lxd_instance" "instance1" {
#   name  = "instance1"
#   image = "ubuntu-daily:22.04"

#   config = {
#     "boot.autostart" = true
#   }

#   limits = {
#     cpu = 2
#   }
# }