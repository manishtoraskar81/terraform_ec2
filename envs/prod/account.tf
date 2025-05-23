
#Change of default configuration regarding EBS encryption must be forbidden
resource "aws_ebs_encryption_by_default" "example" {
  enabled = true
}