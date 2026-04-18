variable "cluster_name"       {}
variable "subnet_ids"         { type = list(string) }
variable "devops_role_arn"    {}
variable "k8s_version"        { default = "1.29" }
variable "node_instance_type" { default = "t3.medium" }
