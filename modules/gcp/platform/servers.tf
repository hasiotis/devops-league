module "servers" {
  for_each = {
    "web01"    = "webservers"
    "web02"    = "webservers"
    "worker01" = "workers"
    "worker02" = "workers"
  }
  source        = "../vm"
  hostname      = "${each.key}-${var.client_name}"
  project       = "infra-hasiotis"
  network       = "default"
  instance_type = "g1-small"
  ansible_env   = var.client_name
  ansible_group = each.value
}
