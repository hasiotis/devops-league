terraform {
  required_providers {
    linode = {
      source = "linode/linode"
    }
  }
}

locals {
  publickey = file("~/.ssh/id_rsa.pub")
}
