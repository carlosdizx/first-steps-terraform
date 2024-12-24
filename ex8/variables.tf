variable "vpc_main_cidr" {
  description = "Dirección ip de la vpc"
  type        = string
}

variable "subnets_main_cidr" {
  description = "Direcciones ips de la vpc para las subnets"
  type        = list(string)
}
