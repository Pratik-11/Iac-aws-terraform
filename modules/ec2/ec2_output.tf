output "public_ip" {
  value = aws_instance.firsttime.public_ip
  description = "The IP address of the instance"
}