resource "aws_ebs_volume" "this" {
  for_each = { for idx, volume in flatten(var.volumes) : "${volume.instance_id}-${volume.device_name}" => volume }

  availability_zone = each.value.availability_zone
  size              = each.value.size
  type              = each.value.type
  encrypted         = each.value.encrypted
  iops              = each.value.iops
  tags              = each.value.tags
}

resource "aws_volume_attachment" "this" {
  for_each          = { for idx, volume in flatten(var.volumes) : "${volume.instance_id}-${volume.device_name}" => volume }

  device_name       = each.value.device_name
  volume_id         = aws_ebs_volume.this[each.key].id
  instance_id       = each.value.instance_id
}
