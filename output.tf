output "ips" {
  value = [aws_instance.myinstance.public_ip]
}
