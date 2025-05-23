module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  for_each = var.ec2_instances

  name                   = each.value.ec2_name
  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  subnet_id              = each.value.subnet_id
  key_name               = module.ec2_keys[each.key].key_pair_name
  vpc_security_group_ids = [aws_security_group.sg_ec2.id]
  associate_public_ip_address = false

  tags = merge(local.default_tags, var.additional_tags, {
    Name = each.value.ec2_name
  })


  root_block_device = [
    {
      encrypted   = true
      kms_key_id  = module.kms_ebs.key_arn
      volume_type = "gp3"
      throughput  = 200
      volume_size = 9
      delete_on_termination = false
    }
  ]

  metadata_options = {
    "http_endpoint" : "enabled"
    "http_put_response_hop_limit" : 2
    "http_tokens" : "required"
  }

}
