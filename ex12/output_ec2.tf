output "output_ec2_ip_public" {
  description = "Direcciones IP públicas de las instancias EC2"
  value = {
    for key, instance in aws_instance.servers :
    instance.tags["Name"] => "http://${instance.public_ip}"
  }
}
