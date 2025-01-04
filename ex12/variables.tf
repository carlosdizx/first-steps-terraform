variable "vpc_main_cidr" {
  description = "Dirección ip de la vpc"
  type        = string
}

variable "subnets_main_cidr" {
  description = "Direcciones ips de la vpc para las subnets"
  type        = list(string)
}

variable "tags" {
  description = "Etiquetas de los recursos"
  type        = map(string)
}


variable "details_instances" {
  description = "Parámetros de la instancia"
  type        = map(string)
  default = {
    ami  = "ami-01816d07b1128cd2d"
    type = "t2.micro"
  }
}

variable "spec_instances" {
  description = "Lista de configuración por instancia"
  type        = list(string)
  default     = ["Node", "PHP", "Python"]
}


