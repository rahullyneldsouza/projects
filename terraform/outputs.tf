output "kubeconfig" {
  value = linode_lke_cluster.k8s.kubeconfig
  sensitive = true
}