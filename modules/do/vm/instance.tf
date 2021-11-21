data "template_file" "user_data" {
  template = file("${path.module}/cloud-init.yaml")
  vars = {
    hostname = var.hostname
  }
}

resource "digitalocean_droplet" "instance" {
  name      = "${var.hostname}.demo.hasiotis.dev"
  image     = var.instance_image
  size      = var.instance_type
  region    = var.region
  ssh_keys  = [var.publickey]
  tags      = [var.ansible_env, var.ansible_group]
  user_data = data.template_file.user_data.rendered
}

resource "google_dns_record_set" "dns_record" {
  name = "${var.hostname}.demo.hasiotis.dev."
  type = "A"
  ttl  = 300

  managed_zone = "demo-hasiotis-dev"
  rrdatas      = [digitalocean_droplet.instance.ipv4_address]
  project      = "infra-hasiotis"
}
