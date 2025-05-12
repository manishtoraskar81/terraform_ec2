ec2_configs = {
  "kgawsnytest1" = {
    ec2_name          = "kgawsnytest1"
    ami               = "ami-001b528478909f262"
    instance_type     = "t2.micro"
    subnet_id         = "subnet-07cc3be1258ee8660"
    security_group_ids = ["sg-0a6a5a3cca67bd97e"]
    tags              = {
      Name = "kgawsnytest1"
      Env  = "nonprod"
    }
    kms_key_id        = "fc12a241-8c2a-47a5-9e7c-f7558e9d5f7a"
  }
}