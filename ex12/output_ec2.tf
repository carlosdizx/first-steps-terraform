output "output_ec2_ip_public" {
  description = "Direcciones IP públicas de las instancias EC2"
  value = {
    for key, instance in aws_instance.servers :
    instance.tags["Name"] => "http://${instance.public_ip}"
  }
}

output "checker_instance_ip" {
  description = "IP pública de la instancia Checker (si existe)"
  value       = "ssh -i myKey.pem ec2-user@${aws_instance.checker_instance[0].public_ip}"
  depends_on  = [aws_instance.checker_instance]
}

