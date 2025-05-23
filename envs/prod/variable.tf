variable "account_id" {
  description = "Account ID where the resources are deployed"
  type        = string
  default     = "385764924434"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_id" {
  description = "The ID of the VPC where the resources are deployed"
  type        = string
  default     = null
}

variable "ec2_instances" {
  description = "Map of EC2 instance configurations"
  type = map(object({
    ec2_name           = string
    ami                = string
    instance_type      = string
    subnet_id          = string
    security_group_names = list(string)

    #root volume
    volume_size        = number
    throughput         = number
    volume_type        = string

    
    tags              = map(string)
  }))
}

variable "additional_tags" {
  description = "A mapping of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

# ==================
# testing
#==================

variable "volumes" {
  description = "List of EBS volumes to create and attach"
  type = map(object({
    instance_name     = string
    size            = number
    type            = string
    device_name     = string
    iops            = optional(number)
    tags            = map(string)
    #availability_zone = string
  }))
}


variable "security_groups" {
  description = "Map of security groups to create"
  type = map(object({
    description = string
    ingress     = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      description = string
    }))
    egress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      description = string
    }))
    tags = map(string)
  }))
}

#variable "ec2_sg_mapping" {
#  description = "Mapping of EC2 instance keys to lists of security group names"
#  type = map(list(string))
#}