#variable "volumes" {
#  description = "List of EBS volumes to create and attach"
#  type = list(object({
#    instance_id = string
#    availability_zone = string
#    size        = number
#    type        = string
#    device_name = string
#    encrypted   = bool
#    iops        = optional(number)
#    tags        = map(string)
#  }))
#}

#variable "availability_zone" {
#    description = "Availability zone to provision the volume in."
#    type = string
#}

variable "encrypted" {
    description = "Whether to encrypt the volume."
    type = bool
    default = true
}

#variable "kms_key_id" {
#    description = "KMS key ID to encrypt the volume with."
#    type = string
#    default = null
#}
#
#variable "common_tags" {
#    description = "Tags to apply to volume."
#    type = map(string)
#    default = {}
#}


#variable "volumes" {
#  description = "Configuration for a single EBS volume to create and attach"
#  type = object({
#    instance_id       = string
#    availability_zone = string
#    size              = number
#    type              = string
#    device_name       = string
#    encrypted         = bool
#    iops              = optional(number)
#    tags              = map(string)
#  })
#}

variable "instance_id" {

}

variable "availability_zone" {

}

variable "size" {

}
variable "type" {}

variable "device_name" {}

variable "iops" {}

variable "tags" {}

variable "kms_key_id" {}
