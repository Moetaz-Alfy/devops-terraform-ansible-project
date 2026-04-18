variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "depi-eks-cluster"
}

variable "key_name" {
  description = "SSH Key Pair Name"
  default     = "depi-key"
}
