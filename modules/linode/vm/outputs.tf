output "instance_id" {
  value = linode_instance.instance.id
}

output "public_ip" {
  value = linode_instance.instance.ip_address
}
