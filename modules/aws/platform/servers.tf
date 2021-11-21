module "servers" {
  for_each = {
    "web01"    = "webservers"
    "web02"    = "webservers"
    "worker01" = "workers"
    "worker02" = "workers"
  }
  source        = "../vm"
  hostname      = "${each.key}-${var.client_name}"
  vpc           = "demo-vpc"
  subnet        = "demo-public-subnet"
  instance_type = "t2.small"
  ansible_env   = var.client_name
  ansible_group = each.value
}


# Create a vpc to host the VMs (using the *client_name*)
# Create any cloud specific LBs
# You might need to create a managed DB
# Or create an extra VM if the cloud provider can't provide one
