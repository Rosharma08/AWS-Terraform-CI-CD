variable "vpc_id" {
  description = "VPC ID where subnet will be created"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone for subnet"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}