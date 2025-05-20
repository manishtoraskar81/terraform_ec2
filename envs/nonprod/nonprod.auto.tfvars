vpc_id = "vpc-0f8e267e4cb618066"

additional_tags = {
  Env      = "nonprod"
  Owner    = "self"
  Project  = "921"
  Support  = "self"
  TeamName = "my_team"
}

ec2_instances = {
  "kgawsnytest1" = {
    ec2_name           = "kgawsnytest1"
    ami                = "ami-001b528478909f262"
    instance_type      = "t2.micro"
    subnet_id          = "subnet-07cc3be1258ee8660"   
  },
  #"kgawsnytest2" = {
  #  ec2_name           = "kgawsnytest2"
  #  ami                = "ami-001b528478909f262"
  #  instance_type      = "t2.micro"
  #  subnet_id          = "subnet-07cc3be1258ee8660"
  #}
}