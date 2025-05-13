variable "account_id" {
  defualt = "969837447401"
}

variable "aws_region" {
    default = "us-east-1"
}

variable "vpc_id" {
  description = "The ID of the VPC where the resources are deployed"
  type        = string
  default     = null
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

variable "additional_tags" {
  description = "A mapping of tags to assign to the resources."
  type        = map(string)
  default     = {}
}