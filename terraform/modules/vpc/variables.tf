variable "vpc_cidr"       {}
variable "azs"            { type = list(string) }
variable "public_subnets" { type = list(string) }
variable "cluster_name"   {}
