# terraform/provider.tf
terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "~> 1.0"
    }
  }
}

provider "linode" {
  token = var.linode_token
}