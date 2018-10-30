variable "cluster-name" {
    default = "kubernetes--demo"
    type    = "string"
}

variable "vpc_id" {
    default = "vpc-78a2071d"
    type    = "string"
}

variable "subnet_id_1" {
    # elife-kubernetes-subnet-1
    default = "subnet-0c60bc3cb24a2816b"
    type    = "string"
}

variable "subnet_id_2" {
    # elife-kubernetes-subnet-2
    default = "subnet-009a04cbefc8e3661"
    type    = "string"
}
