output "vpc_id" {
  description = "The ID of the created VPC"
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "The ID of the first public subnet"
  value = aws_subnet.public_subnets[0].id  
}

output "private_subnet_id" {
  description = "The ID of the first public subnet"
  value = aws_subnet.private_subnets[0].id  
}

output "public_route_table_id" {
  description = "The Route Table ID for the public subnets"
  value       = aws_route_table.public_rt.id
}

output "private_route_table_id" {
  description = "The Route Table ID for the private subnets"
  value       = aws_route_table.private_rt.id
}
