output "instance_id" {
  value = google_compute_instance.instance.id
}

output "public_ip" {
  value = google_compute_address.public_ip.address
}
