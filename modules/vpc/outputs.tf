output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = aws_vpc.this.arn
}

output "security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = aws_security_group.this.id
}

output "route_table_id" {
  description = "The ID of the route table associated with this VPC"
  value       = aws_route_table.public.id
}

output "public_subnet_id" {
  description = "ID of public subnet"
  value       = aws_subnet.public.id
}

output "public_subnet_arn" {
  description = "ARN of public subnet"
  value       = aws_subnet.public.arn
}

output "ig_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.this.id
}

output "ig_arn" {
  description = "The ARN of the Internet Gateway"
  value       = aws_internet_gateway.this.arn
}