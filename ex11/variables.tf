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


variable "instance_ami_id" {
  description = "Id de instancia us-east-1"
  type        = string
  default     = "ami-01816d07b1128cd2d"
}