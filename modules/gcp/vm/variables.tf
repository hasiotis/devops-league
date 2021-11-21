variable "hostname" {
  description = "Hostname"
  type        = string
}

variable "instance_image" {
  description = "Instance Image"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
}

variable "project" {
  description = "GCP Project"
  type        = string
}

variable "network" {
  description = "GCP network"
  type        = string
  default     = "default"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "europe-west1-b"
}

variable "root_size" {
  description = "Root disk size"
  type        = number
  default     = 20
}

variable "root_type" {
  description = "Root disk type"
  type        = string
  default     = "pd-balanced"
}

variable "ansible_env" {
  description = "Ansible Environment"
  type        = string
}

variable "ansible_group" {
  description = "Ansible Group"
  type        = string
}
