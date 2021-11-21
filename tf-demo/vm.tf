module "aws" {
  source        = "../modules/aws/vm"
  hostname      = "aws"
  vpc           = "demo-vpc"
  subnet        = "demo-public-subnet"
  instance_type = "t2.small"
  ansible_env   = "demo"
  ansible_group = "aws_nodes"
}

module "gcp" {
  source        = "../modules/gcp/vm"
  hostname      = "gcp"
  project       = "infra-hasiotis"
  network       = "default"
  instance_type = "g1-small"
  ansible_env   = "demo"
  ansible_group = "gcp_nodes"
}

module "linode" {
  source        = "../modules/linode/vm"
  hostname      = "linode"
  region        = "eu-central"
  instance_type = "g6-nanode-1"
  ansible_env   = "demo"
  ansible_group = "linode_nodes"
}

module "do" {
  source        = "../modules/do/vm"
  hostname      = "do"
  region        = "fra1"
  instance_type = "s-1vcpu-1gb"
  ansible_env   = "demo"
  ansible_group = "do_nodes"
}

output "info" {
  value = {
    aws    = "IP: ${module.aws.public_ip} (${module.aws.instance_id})",
    gcp    = "IP: ${module.gcp.public_ip} (${module.gcp.instance_id})",
    linode = "IP: ${module.linode.public_ip} (${module.linode.instance_id})",
    do     = "IP: ${module.do.public_ip} (${module.do.instance_id})"
  }
}
