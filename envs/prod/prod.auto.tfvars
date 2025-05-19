vpc_id = "vpc-0f8e267e4cb618066"

additional_tags = {
    Env            = "prod"
    Owner          = "self"
    Project        = "921"
    Support        = "self"
    TeamName       = "my_team"
}

ec2_instances = {
  "kgawsnytest1" = {
    ec2_name          = "kgawsnyprod1"
    ami               = "ami-001b528478909f262"
    instance_type     = "t2.micro"
    subnet_id         = "subnet-07cc3be1258ee8660"
    security_group_ids = ["sg-0a6a5a3cca67bd97e"]
  },
  "kgawsnyprod2" = {
    ec2_name          = "kgawsnyprod2"
    ami               = "ami-001b528478909f262"
    instance_type     = "t2.micro"
    subnet_id         = "subnet-07cc3be1258ee8660"
    security_group_ids = ["sg-0a6a5a3cca67bd97e"]
  }
}