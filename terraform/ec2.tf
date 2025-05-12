module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = each.value.ec2_name

  for_each = var.ec2_configs

  ami               = each.value.ami
  instance_type     = each.value.instance_type
  subnet_id         = each.value.subnet_id
  vpc_security_group_ids = each.value.security_group_ids
  tags              = each.value.tags

  root_block_device = [
    {
      encrypted   = true
      kms_key_id  = each.value.kms_key_id
      volume_type = "gp3"
      throughput  = 200
      volume_size = 5
      tags = {
        
      }
    }
  ]

  metadata_options = { 
    "http_endpoint": "enabled"
    "http_put_response_hop_limit": 2
    "http_tokens": "required" 
  }

}
