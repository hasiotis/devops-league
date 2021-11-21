module "servers" {
  for_each = {
    "web01"    = "webservers"
    "web02"    = "webservers"
    "worker01" = "workers"
    "worker02" = "workers"
  }
  source        = "../vm"
  hostname      = "${each.key}-${var.client_name}"
  region        = "fra1"
  instance_type = "s-1vcpu-1gb"
  ansible_env   = var.client_name
  ansible_group = each.value
}
