resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.clustername
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.clustername
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name             = "default"
    node_count       = var.default_node_count
    vm_size          = var.vm_size
    os_disk_size_gb  = 30
  }
  
  service_principal {
    client_id       = var.client_id
    client_secret   = var.client_secret
  }

  tags = {
    environment     = "Demo"
  }

}

resource "azurerm_kubernetes_cluster_node_pool" "node_pool1" {
  name                  = var.node_pool1_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  node_count            = var.node_count
  min_count             = var.min_count
  max_count             = var.max_count
  vm_size               = var.vm_size
  os_disk_size_gb       = var.os_disk_size_gb
  max_pods              = var.max_pods
  enable_auto_scaling   = var.enable_auto_scaling
  priority              = "Spot"
  eviction_policy       = "Delete"

  tags = {
    Environment = "dev"
  }

  depends_on = [
    azurerm_kubernetes_cluster.aks_cluster
  ]

}

 resource "azurerm_kubernetes_cluster_node_pool" "node_pool2" {
   name                  = var.node_pool2_name
   kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
   node_count            = var.node_count
   min_count             = var.min_count
   max_count             = var.max_count
   vm_size               = var.vm_size
   os_disk_size_gb       = var.os_disk_size_gb
   max_pods              = var.max_pods
   enable_auto_scaling   = var.enable_auto_scaling
   priority              = "Spot"
   eviction_policy       = "Delete"
 
   tags = {
     Environment = "dev"
   }
 
   depends_on = [
     azurerm_kubernetes_cluster.aks_cluster
   ]
 
 }

resource "local_file" "kubeconfig" {
  content  = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  filename = "${path.module}/kubeconfig"
}