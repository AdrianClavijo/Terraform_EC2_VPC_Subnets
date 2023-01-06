# EC2 
output "ec2_id" {
  description = "The ID of the instance"
  value       = aws_instance.this.id
}

output "ec2_arn" {
  description = "The ARN of the instance"
  value       = aws_instance.this.arn
}