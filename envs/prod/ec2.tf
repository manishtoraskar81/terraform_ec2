module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  for_each = var.ec2_instances

  name                   = each.value.ec2_name
  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  subnet_id              = each.value.subnet_id
  key_name               = module.ec2_keys[each.key].key_pair_name
  vpc_security_group_ids = [
      for sg_name in each.value.security_group_names :
      aws_security_group.sg[sg_name].id
    ]
  associate_public_ip_address = false

  tags = merge(local.default_tags, var.additional_tags, each.value.tags,{
    Name = each.value.ec2_name
  })


  root_block_device = [
    {
      encrypted   = true
      kms_key_id  = module.kms_ebs.key_arn
      volume_type = each.value.volume_type
      throughput  = each.value.throughput
      volume_size = each.value.volume_size
      delete_on_termination = false
    }
  ]

  #Instance Metadata Service Version 2 (IMDSv2)
  metadata_options = {
    "http_endpoint" : "enabled"
    "http_put_response_hop_limit" : 2
    "http_tokens" : "required"
  }

}
