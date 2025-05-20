output "ids" {
    value = [for v in aws_ebs_volume.this : v.id]
}
