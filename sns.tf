# Crear un tema SNS para las alertas
resource "aws_sns_topic" "example" {
  name = "high-cpu-alerts"
}

# Suscripción al tema SNS (enviar alertas por correo electrónico)
resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.example.arn
  protocol  = "email"
  endpoint  = "luisjulianrodriguez7@gmail.com" 
}
