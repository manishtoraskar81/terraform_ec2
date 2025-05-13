resource "aws_secretsmanager_secret" "ssh_key" {
  for_each    = var.ec2_instances
  name        = "${each.value.ec2_name}-ssh-private-key"
  description = "Private key for ${each.value.ec2_name} EC2"
}

resource "aws_secretsmanager_secret_version" "ssh_key" {
  for_each      = var.ec2_instances
  secret_id     = aws_secretsmanager_secret.ssh_key[each.key].id
  secret_string = module.ec2_keys[each.key].private_key_pem
}
