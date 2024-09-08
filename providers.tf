provider "lxd" {
  generate_client_certificates = true
  accept_remote_certificate    = true

  remote {
    name     = "local"
    address  = "https://192.168.1.120:8443"
    password = "password"
    default  = true
  }
}