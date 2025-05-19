# KMS CMK for EC2
data "aws_iam_policy_document" "kms_allow_ec2_ebs" {
  statement {
    actions = [
      "kms:*"
    ]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.account_id}:root"]
    }
    resources = ["*"]
  }

  statement {
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    resources = ["*"]
  }
}

module "kms_ebs" {
  source  = "terraform-aws-modules/kms/aws"
  version = "3.1.1"

  aliases                 = ["ec2-ebs/fs"]
  description             = "KMS Key to encrypt the EBS file system"
  key_administrators      = ["arn:aws:iam::${var.account_id}:root"]
  key_usage               = "ENCRYPT_DECRYPT"
  enable_key_rotation     = true
  rotation_period_in_days = 365
  multi_region            = false
  policy                  = data.aws_iam_policy_document.kms_allow_ec2_ebs.json
  tags                    = merge(local.default_tags, var.additional_tags)
}

# KMS CMK for SecretManager
data "aws_iam_policy_document" "kms_allow_secretmanager" {
  statement {
    actions = [
      "kms:*"
    ]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.account_id}:root"]
    }
    resources = ["*"]
  }

  statement {
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    principals {
      type        = "Service"
      identifiers = ["secretsmanager.amazonaws.com"]
    }
    resources = ["*"]
  }
}

module "kms_secretsmanager" {
  source  = "terraform-aws-modules/kms/aws"
  version = "3.1.1"

  aliases                 = ["fsx-ontap/secretsmanager"]
  description             = "KMS Key to encrypt the file system of FSX OnTap at rest"
  key_administrators      = ["arn:aws:iam::${var.account_id}:root"]
  key_usage               = "ENCRYPT_DECRYPT"
  enable_key_rotation     = true
  rotation_period_in_days = 365
  multi_region            = false
  policy                  = data.aws_iam_policy_document.kms_allow_secretmanager.json
  tags                    = merge(local.default_tags, var.additional_tags)
}