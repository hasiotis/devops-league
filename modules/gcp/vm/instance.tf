resource "google_compute_instance" "instance" {
  name         = var.hostname
  hostname     = "${var.hostname}.demo.hasiotis.dev"
  machine_type = var.instance_type
  zone         = var.zone
  project      = var.project

  boot_disk {
    initialize_params {
      image = var.instance_image
      type  = var.root_type
      size  = var.root_size
    }
  }

  network_interface {
    network = var.network
    access_config {
      nat_ip = google_compute_address.public_ip.address
    }
  }

  metadata = {
    ssh-keys = "sre:${local.publickey}"
  }

  labels = {
    ansible_env   = var.ansible_env
    ansible_group = var.ansible_group
  }

  depends_on = [google_compute_address.public_ip]
}

resource "google_compute_address" "public_ip" {
  name         = "${var.hostname}-public-ip"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  description  = "Public ip reserved for ${var.hostname}"
  project      = var.project
}

resource "google_dns_record_set" "dns_record" {
  name = "${var.hostname}.demo.hasiotis.dev."
  type = "A"
  ttl  = 300

  managed_zone = "demo-hasiotis-dev"
  rrdatas      = [google_compute_address.public_ip.address]
  project      = "infra-hasiotis"
}
