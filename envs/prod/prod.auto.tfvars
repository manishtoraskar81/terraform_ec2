vpc_id = "vpc-0e8902173c96d2a89"

additional_tags = {
  Env      = "prod"
  Owner    = "self"
  Project  = "921"
  Support  = "self"
  TeamName = "my_team"
}

ec2_instances = {
  "kgawsnyprod1" = {
    ec2_name           = "kgawsnyprod1"
    ami                = "ami-001b528478909f262"
    instance_type      = "t2.micro"
    subnet_id          = "subnet-040b6a1d8026f9d1a"
  },
  #"kgawsnyprod2" = {
  #  ec2_name           = "kgawsnyprod2"
  #  ami                = "ami-001b528478909f262"
  #  instance_type      = "t2.micro"
  #  subnet_id          = "subnet-040b6a1d8026f9d1a"
  #}
}