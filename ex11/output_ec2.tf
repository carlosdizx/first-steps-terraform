output "output_ec2_ip_public" {
  description = "Ip publica de la instancia EC2"
  value       = aws_instance.public_instance.public_ip
}