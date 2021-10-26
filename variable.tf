variable "prefix" {
  default = "linkinn"
}
variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}
variable "cluster_name" {
  default = "keanu"
}
variable "retention_days" {
  default = 30
}
variable "desired_size" {
  default = 1
}
variable "max_size" {
  default = 1
}
variable "min_size" {
  default = 1
}

variable "machine_type" {
  default = ["t2.small"]
}

variable "workspace" {
  default = "staging"
}
