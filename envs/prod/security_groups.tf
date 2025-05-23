# Security groups for AWS ec2 

#resource "aws_security_group" "sg_ec2" {
#  name        = "ec2-sg"
#  description = "Security group for AWS EC2"
#  vpc_id      = var.vpc_id
#
#  ingress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["172.16.0.0/12", "10.0.0.0/8"]
#    description = "Allow Inbound traffic from Kering private networks"
#  }
#
#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#    description = "Allow outbound traffic to any destination"
#  }
#
#  tags = merge(local.default_tags, var.additional_tags, { Name = "ec2-instance" })
#}

#dynamic security groups
resource "aws_security_group" "sg" {
  for_each = var.security_groups

  name        = each.key
  description = each.value.description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = each.value.ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }

  dynamic "egress" {
    for_each = each.value.egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      description = egress.value.description
    }
  }

  tags = each.value.tags
}
