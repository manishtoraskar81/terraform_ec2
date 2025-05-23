#resource "aws_ebs_volume" "this" {
#  for_each = { for idx, volume in flatten(var.volumes) : "${volume.instance_id}-${volume.device_name}" => volume }
#
#  availability_zone = each.value.availability_zone
#  size              = each.value.size
#  type              = each.value.type
#  encrypted         = each.value.encrypted
#  iops              = each.value.iops
#  tags              = each.value.tags
#}
#
#resource "aws_volume_attachment" "this" {
#  for_each          = { for idx, volume in flatten(var.volumes) : "${volume.instance_id}-${volume.device_name}" => volume }
#
#  device_name       = each.value.device_name
#  volume_id         = aws_ebs_volume.this[each.key].id
#  instance_id       = each.value.instance_id
#}


# ==================
# testing
#==================

resource "aws_ebs_volume" "this" {
  #for_each = { for idx, volume in var.volumes : "${var.instance_id}-${volume.device_name}" => volume }

  availability_zone = var.availability_zone
  size              = var.size
  type              = var.type
  encrypted         = var.encrypted
  kms_key_id        = var.kms_key_id
  iops              = var.iops
  tags              = var.tags

}

resource "aws_volume_attachment" "this" {
  #for_each = aws_ebs_volume.this

  device_name = var.device_name
  volume_id   = aws_ebs_volume.this.id
  instance_id = var.instance_id
}

