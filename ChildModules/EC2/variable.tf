variable "ami_id" {

  description = "AMI ID for application EC2"

  type = string

}

variable "instance_type" {

  description = "EC2 instance type"

  type = string

}

variable "subnet_id" {

  description = "Public subnet ID for application EC2"

  type = string

}

variable "security_group_id" {

  description = "Security group ID for application EC2"

  type = string

}

variable "key_name" {

  description = "EC2 key pair name"

  type = string

}

variable "environment" {

  description = "Environment name"

  type = string

}

variable "instance_name" {

  description = "Name of the application EC2"

  type = string

}