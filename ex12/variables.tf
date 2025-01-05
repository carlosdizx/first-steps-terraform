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
  type = map(object({
    script = string
    name   = string
  }))
  default = {
    "node-server" = {
      script = "node_script.sh"
      name   = "Node.js Server"
    }
    "php-server" = {
      script = "php_script.sh"
      name   = "PHP Server"
    },
    "python-server" = {
      script = "python_script.sh"
      name   = "Python Server"
    },
  }
}

variable "enable_checker_instance" {
  description = "Flag para habilitar la instancia que verifica las otras"
  type        = bool
  default     = false
}