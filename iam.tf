# Crear una política de IAM para permitir el acceso a CloudWatch y S3
resource "aws_iam_policy" "ec2_policy" {
  name        = "EC2CloudWatchS3Policy"
  description = "Permite el acceso a CloudWatch y S3 para las instancias EC2"
  
  # Política de permisos
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "cloudwatch:PutMetricData",
          "cloudwatch:GetMetricData",
          "cloudwatch:DescribeAlarms",
          "s3:ListBucket",
          "s3:GetObject"
        ]
        Resource = "*"
      }
    ]
  })
}

# Crear un rol de IAM para la instancia EC2
resource "aws_iam_role" "ec2_role" {
  name               = "EC2InstanceRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Crear un perfil de instancia IAM para la EC2
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "EC2InstanceProfile"
  role = aws_iam_role.ec2_role.name
}

# Adjuntar la política al rol de la EC2
resource "aws_iam_role_policy_attachment" "ec2_policy_attachment" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_policy.arn
}

# Crear una instancia EC2 con el rol de IAM asociado
resource "aws_instance" "example" {
  ami                   = var.ami_id
  instance_type         = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_instance_profile.name  # Asociamos el perfil de instancia a la instancia

  tags = {
    Name = "mi_instancia_ec2"
  }

  monitoring = true  # Activar la supervisión de la instancia EC2
}
