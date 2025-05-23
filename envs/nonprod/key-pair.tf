# Generate an SSH Key Pair dynamically
resource "tls_private_key" "ssh" {
  for_each = var.ec2_instances

  algorithm = "RSA"
  rsa_bits  = 2048
}



module "ec2_keys" {
  source  = "terraform-aws-modules/key-pair/aws"
  version = "~> 2.1.0"

  for_each = var.ec2_instances

  key_name           = "${each.value.ec2_name}-key"
  create_private_key = true
}