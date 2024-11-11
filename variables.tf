variable "instance_type" {
  description = "Tipo de la instancia EC2"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "ID de la AMI"
  default     = "ami-0c02fb55956c7d316"
}

variable "desired_capacity" {
  description = "Capacidad deseada del Auto Scaling Group"
  default     = 1
}

variable "max_size" {
  description = "Número máximo de instancias en Auto Scaling"
  default     = 3
}

variable "min_size" {
  description = "Número mínimo de instancias en Auto Scaling"
  default     = 1
}
