
output "ids" {
    value = [for v in module.ec2_instance : v.id]
}

output "az" {
  value = { for id, instance in module.ec2_instance : id => instance.availability_zone }
}

#output "ebs_volume_ids" {
#  description = "IDs of the created EBS volumes"
#  value       = aws_ebs_volume.this[*].id
#}
