output "instance_id" {
  value = digitalocean_droplet.instance.id
}

output "public_ip" {
  value = digitalocean_droplet.instance.ipv4_address
}
