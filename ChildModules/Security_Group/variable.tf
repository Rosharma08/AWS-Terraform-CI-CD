variable "vpc_id" {
  description = "VPC ID where security group will be created"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "security_group_name" {
  description = "Security group name"
  type        = string
}

variable "description" {
  description = "Security group description"
  type        = string
}


variable "allowed_egress_cidr" {
  description = "CIDR allowed for outbound traffic"
  type        = string
}
variable "ingress_rules" {
  description = "List of inbound security group rules"

  type = list(object({
    from_port                = number
    to_port                  = number
    protocol                 = string
    cidr                     = optional(string)
    source_security_group_id = optional(string)
  }))
}