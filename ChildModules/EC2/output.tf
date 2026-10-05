output "instance_id" {
  description = "ID of the application EC2 instance"
  value       = aws_instance.this.id
}