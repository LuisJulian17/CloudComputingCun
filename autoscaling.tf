# Obtener las subredes de la VPC predeterminada
data "aws_subnets" "default" {
  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}

# Crear la plantilla de lanzamiento para las instancias
resource "aws_launch_template" "example" {
  name = "example-launch-template"
  
  # Especifica el tipo de instancia
  instance_type = "t2.micro"
  
  # Define la AMI para la instancia
  image_id = var.ami_id

  # Asociar el grupo de seguridad usando el ID del grupo de seguridad
  network_interfaces {
    security_groups = [aws_security_group.default.id]  # Usar el ID del grupo de seguridad
  }
}

# Crear un grupo de seguridad
resource "aws_security_group" "default" {
  name_prefix = "example-sg-"
  description = "Security group for example"
}

# Configuración del grupo de autoescalado (Auto Scaling Group) usando las subredes predeterminadas
resource "aws_autoscaling_group" "example" {
  desired_capacity     = 1
  max_size             = 2
  min_size             = 1
  vpc_zone_identifier  = data.aws_subnets.default.ids  # Usar subnets predeterminadas obtenidas

  launch_template {
    id      = aws_launch_template.example.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "autoscaling-example"
    propagate_at_launch = true
  }
}
