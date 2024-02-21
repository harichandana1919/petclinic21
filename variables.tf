variable "clustername" {
  description = "cluster name need to be create"
  type        = string   
}

variable "location" {
  description = "location cluster need to be create"
  type        = string
}

variable "kubernetes_version" {
  description = "cluster version need to be create"
  type        = string
}

variable "resource_group_name" {
  description = "in which resource group cluster need to be create"
  type        = string
}

variable  "default_node_count" {
  description = "default node count"
  type        = string
}

variable "vm_size" {
  description = "vm size need to use in cluster"
  type        = string
}

variable "node_pool1_name" {
  description = "nodepool1 name need to be create"
  type        = string
}

variable "node_pool2_name" {
  description = "nodepool1 name need to be create"
  type        = string
}

variable "node_count" {
  description = "node count need to be create"
  type        = string
}

variable "os_disk_size_gb" {
  description = "disk size for the node need to be create"
  type        = string
}

variable "min_count" {
  description = "minimum node count for nodepool"
  type        = string
}

variable "max_count" {
  description = "maximum node count for nodepool"
  type        = string
}

variable "enable_auto_scaling" {
  description = "enabling autoscaling for nodepool"
  type        = string
}

variable "max_pods" {
  description = "max pods for each node "
  type        = string
}

variable "client_id" {
  description = "client id of the service principal "
  type        = string
}

variable "client_secret" {
  description = "client secret of the service principal "
  type        = string
}