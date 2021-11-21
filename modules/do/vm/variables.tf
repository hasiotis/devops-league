variable "hostname" {
  description = "Hostname"
  type        = string
}

# doctl compute image list --public
variable "instance_image" {
  description = "Droplet Image"
  type        = string
  default     = "ubuntu-20-04-x64"
}

variable "instance_type" {
  description = "Droplet Size"
  type        = string
}

variable "region" {
  description = "Droplet Region"
  type        = string
  default     = "lon1"
}

variable "publickey" {
  description = "Droplet ssh keys"
  type        = string
  default     = "1d:06:81:07:1f:d5:1b:87:28:da:96:57:94:45:96:cf"
}

variable "ansible_env" {
  description = "Ansible Environment"
  type        = string
}

variable "ansible_group" {
  description = "Ansible Group"
  type        = string
}
