data "template_file" "script" {
  template = file("${path.module}/cloud-init.yaml")
  vars = {
    hostname  = var.hostname
    publickey = local.publickey
  }
}

data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.script.rendered
  }
}

resource "linode_instance" "instance" {
  label          = "${var.hostname}.demo.hasiotis.dev"
  image          = var.instance_image
  region         = var.region
  type           = var.instance_type
  group          = var.ansible_env
  tags           = [var.ansible_env, var.ansible_group]
  stackscript_id = 927229 # <- You have to create this one
  stackscript_data = {
    "userdata" = "${data.template_cloudinit_config.config.rendered}"
  }
}

resource "google_dns_record_set" "dns_record" {
  name = "${var.hostname}.demo.hasiotis.dev."
  type = "A"
  ttl  = 300

  managed_zone = "demo-hasiotis-dev"
  rrdatas      = [linode_instance.instance.ip_address]
  project      = "infra-hasiotis"
}
