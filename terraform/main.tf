resource "aws_instance" "ec2" {
  instance_type = "t2.medium"
  ami = "ami-001b528478909f262"
  key_name = "ec2-fj"
}