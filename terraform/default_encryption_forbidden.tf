
resource "aws_ebs_encryption_by_default" "example" {
  enabled = false
}

resource "aws_config_config_rule" "ebs_encryption_check" {
  name = "ebs-encryption-check"

  source {
    owner             = "AWS"
    source_identifier = "EBS_SNAPSHOT_MANAGED_ENCRYPTION_CHECK"
  }

  scope {
    compliance_resource_types = ["AWS::EC2::Volume"]
  }
}

