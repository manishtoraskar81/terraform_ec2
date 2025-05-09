resource "aws_instance" "ec2" {
  instance_type = "t3.micro"
  ami = "ami-001b528478909f262"
}