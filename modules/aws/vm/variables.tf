variable "hostname" {
  description = "Hostname"
  type        = string
}

variable "instance_ami" {
  description = "Instance AMI"
  type        = string
  default     = "ami-08edbb0e85d6a0a07" # Ubuntu 20.04
  # https://cloud-images.ubuntu.com/locator/ec2/
}

variable "subnet" {
  description = "Subnet CIDR"
  type        = string
}

variable "vpc" {
  description = "VPC ID"
  type        = string
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
}

variable "key_name" {
  description = "SSH Key name"
  type        = string
  default     = "sre-key"
}

variable "root_size" {
  description = "Root disk size"
  type        = number
  default     = 20
}

variable "root_type" {
  description = "Root disk type"
  type        = string
  default     = "gp2"
}

variable "ansible_env" {
  description = "Ansible Environment"
  type        = string
}

variable "ansible_group" {
  description = "Ansible Group"
  type        = string
}
