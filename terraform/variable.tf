variable "aws_region" {
    default = "us-east-1"
}

variable "ec2_configs" {
  description = "Map of EC2 instance configurations"
  type = map(object({
    ec2_name          = string
    ami               = string
    instance_type     = string
    subnet_id         = string
    security_group_ids = list(string)
    tags              = map(string)
    kms_key_id        = string
  }))
}

