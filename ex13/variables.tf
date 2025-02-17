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

variable "open_ai_api_key" {
  description = "Clave API para OpenAI"
  type        = string
  sensitive   = true
}

variable "db_server" {
  description = "Servidor de la base de datos"
  type        = string
}

variable "db_database" {
  description = "Nombre de la base de datos"
  type        = string
}

variable "db_username" {
  description = "Usuario de la base de datos"
  type        = string
}

variable "db_password" {
  description = "Contraseña de la base de datos"
  type        = string
  sensitive   = true
}

variable "db_port" {
  description = "Puerto de la base de datos"
  type        = number
  default     = 1433
}