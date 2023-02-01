variable "cluster_name" {
  description = "name of EKS cluster"
  type = string
  default = "eksdemo"
}

variable "cluster_service_ipv4-cidr" {
  description = "IPv4 CIDR for kubernetes cluster"
  type = string
  default = "null"

}

variable "cluster_version" {
  description = "Kubernetes minor version for cluster"
  type = string
  default = null
}

variable "cluster_endpoint_private_access" {
  description = "Whether EKS private API server should be available"
  type = bool
  default = true
}

variable "cluster_endpoint_public_access" {
  description = "Whether EKS pubic API server should be available"
  type = bool
  default = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access EKS cluster publicly"
  type = list(string)
  default = ["0.0.0.0/0"]
}