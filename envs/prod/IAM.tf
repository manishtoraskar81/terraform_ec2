resource "aws_iam_policy" "deny_ec2_public_ip" {
  name        = "DenyEC2LaunchWithPublicIP"
  description = "Deny launching EC2 instances with public IP"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid      = "DenyEC2LaunchWithPublicIP",
        Effect   = "Deny",
        Action   = "ec2:RunInstances",
        Resource = "arn:aws:ec2:*:*:instance/*",
        Condition = {
          Bool = {
            "ec2:AssociatePublicIpAddress" = "true"
          }
        }
      }
    ]
  })
}


#3resource "aws_iam_role_policy_attachment" "attach_deny_policy_to_role" {
#  role       = aws_iam_role.example.name
#  policy_arn = aws_iam_policy.deny_ec2_public_ip.arn
#}

