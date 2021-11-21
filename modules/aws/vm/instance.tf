data "template_file" "user_data" {
  template = file("${path.module}/cloud-init.yaml")
  vars = {
    hostname = var.hostname
  }
}

resource "aws_instance" "instance" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.region_subnet.id
  user_data                   = data.template_file.user_data.rendered

  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = var.root_size
    volume_type           = var.root_type
  }

  tags = {
    Name               = "${var.hostname}.demo.hasiotis.dev"
    AnsibleEnvironment = var.ansible_env
    AnsibleGroup       = var.ansible_group
  }
}

resource "google_dns_record_set" "dns_record" {
  name = "${var.hostname}.demo.hasiotis.dev."
  type = "A"
  ttl  = 300

  managed_zone = "demo-hasiotis-dev"
  rrdatas      = [aws_instance.instance.public_ip]
  project      = "infra-hasiotis"
}
