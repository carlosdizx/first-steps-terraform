output "output_ec2_ip_public" {
  description = "Dirección IP pública de las instancia EC2 del chatbot"
  value       = "Dirección de la  http://${aws_instance.chatbot.public_ip}"
}