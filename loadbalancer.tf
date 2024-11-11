# Load Balancer usando subnets predeterminadas
resource "aws_lb" "example" {
  name               = "example-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_ssh_http.id]
  subnets            = data.aws_subnets.default.ids  # Referencia la configuración existente

  enable_deletion_protection = false
  idle_timeout               = 60
}
