data "aws_availability_zones" "available" {}

resource "aws_ebs_volume" "encrypted_volume" {
  availability_zone = data.aws_availability_zones.available.names[0]  # Usar la primera zona disponible
  size              = 10
  encrypted         = true
  tags = {
    Name = "EncryptedVolume"
  }
}
