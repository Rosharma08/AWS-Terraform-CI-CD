resource "aws_security_group" "this" {
  name        = "${var.environment}-${var.security_group_name}-sg"
  description = var.description
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.environment}-${var.security_group_name}-sg"
    Environment = var.environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "this" {
  for_each = {
    for index, rule in var.ingress_rules :
    index => rule
  }

  security_group_id = aws_security_group.this.id

  cidr_ipv4              = each.value.cidr
  referenced_security_group_id = each.value.source_security_group_id

  from_port   = each.value.from_port
  to_port     = each.value.to_port
  ip_protocol = each.value.protocol
}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.this.id

  cidr_ipv4   = var.allowed_egress_cidr
  ip_protocol = "-1"
}