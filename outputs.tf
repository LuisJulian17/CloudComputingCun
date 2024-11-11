output "instance_public_ip" {
  value = aws_instance.example.public_ip
}

output "load_balancer_dns" {
  value = aws_lb.example.dns_name
}
