module "servers" {
  for_each = {
    "web01"    = "webservers"
    "web02"    = "webservers"
    "worker01" = "workers"
    "worker02" = "workers"
  }
  source        = "../vm"
  hostname      = "${each.key}-${var.client_name}"
  region        = "eu-central"
  instance_type = "g6-nanode-1"
  ansible_env   = var.client_name
  ansible_group = each.value
}
