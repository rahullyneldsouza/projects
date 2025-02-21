# terraform/main.tf
#provider "linode" {
#  token = var.linode_token
#}

resource "linode_lke_cluster" "k8s" {
  label = "jenkins-k8s"
  region = "us-east"
  k8s_version = "1.22"
  pool {
    type  = "g6-standard-1"
    count = 2
  }
}

