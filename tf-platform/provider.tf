terraform {
  required_version = "~> 1.0.0"

  backend "s3" {
    bucket = "terraform-hasiotis"
    key    = "meta-demo"
    region = "eu-west-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }

    google = {
      version = "~> 3.0"
    }

    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

    linode = {
      source  = "linode/linode"
      version = "~> 1.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

provider "google" {
  project = "infra-hasiotis"
  region  = "europe-west1"
}

provider "digitalocean" {}

provider "linode" {}
