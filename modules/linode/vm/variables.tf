variable "hostname" {
  description = "Hostname"
  type        = string
}

variable "instance_image" {
  description = "Instance Image"
  type        = string
  default     = "linode/ubuntu20.04"
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
}

variable "region" {
  description = "Instance region"
  type        = string
}

variable "ansible_env" {
  description = "Ansible Environment"
  type        = string
}

variable "ansible_group" {
  description = "Ansible Group"
  type        = string
}
