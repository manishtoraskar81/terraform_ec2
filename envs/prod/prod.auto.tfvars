account_id = "385764924434"
aws_region = "us-east-1"
vpc_id = "vpc-0e8902173c96d2a89"

additional_tags = {
  Env      = "nonprod"
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
    #root volume
    volume_size        = 10
    throughput         = 200
    volume_type        = "gp3"

    security_group_names = ["east-west-traffic", "kgawsnyprod1-sg1", "kgawsnyprod1-sg2"]

    tags = {
    }
  },
#  "kgawsnyprod2" = {
#    ec2_name           = "kgawsnyprod2"
#    ami                = "ami-001b528478909f262"
#    instance_type      = "t2.micro"
#    subnet_id          = "subnet-040b6a1d8026f9d1a"
#     #root volume
#     volume_size        = 10
#     throughput         = 200
#     volume_type        = "gp3"
#  }
}
#

#volumes =  [
#    # Volumes for EC2 instance 1
#    { instance_id = module.ec2_instance["kgawsnyprod1"].id, availability_zone = module.ec2_instance["kgawsnyprod1"].availability_zone, size = 2, type = "gp3", device_name = "/dev/sdf", encrypted = false, tags = { Name = "AppVolume-1" } },
#    { instance_id = module.ec2_instance["kgawsnyprod1"].id, availability_zone = module.ec2_instance["kgawsnyprod1"].availability_zone, size = 3, type = "gp3", device_name = "/dev/sdg", encrypted = false, tags = { Name = "DBVolume-1" } },
#    
#    # Volumes for EC2 instance 2
#    #{ instance_id = module.ec2_instances.instance_ids[1], size = 20, type = "gp3", device_name = "/dev/sdh", encrypted = false, tags = { Name = "AppVolume-2" } },
#    #{ instance_id = module.ec2_instances.instance_ids[1], size = 30, type = "gp3", device_name = "/dev/sdi", encrypted = false, tags = { Name = "DBVolume-2" } },
#    
#    # Volumes for EC2 instance 3
#    #{ instance_id = module.ec2_instances.instance_ids[2], size = 20, type = "gp3", device_name = "/dev/sdk", encrypted = false, tags = { Name = "AppVolume-3" } }
#  ] 

volumes = {
    #  Volumes for EC2 kgawsnyprod1
    db = { instance_name  = "kgawsnyprod1", size = 2, type = "gp3", device_name = "/dev/sdf", tags = { Name = "AppVolume-1" } },
    app1 = { instance_name  = "kgawsnyprod1", size = 3, type = "gp3", device_name = "/dev/sdg", tags = { Name = "DBVolume-1" } },

    #  Volumes for EC2 example2
    #db = { instance_name  = "example2", size = 2, type = "gp3", device_name = "/dev/sdf", encrypted = false, tags = { Name = "AppVolume-1" } },
    #app1 = { instance_name  = "example2", size = 3, type = "gp3", device_name = "/dev/sdg", encrypted = false, tags = { Name = "DBVolume-1" } },
}

#ec2_sg_mapping = {
#  "kgawsnyprod1" = ["east-west-traffic", "kgawsnyprod1-sg1", "kgawsnyprod1-sg2"]
#  "kgawsnyprod2" = ["east-west-traffic"]
#}

security_groups = {
  east-west-traffic = {
    description = "East West traffic"
    ingress = [ 
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["172.16.0.0/12", "10.0.0.0/8"]
        description = "Allow Inbound traffic from Kering private networks"
      }
    ]

    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow outbound traffic to any destination"
      }
    ]
    tags = {
      Name = "east-west-traffic"
    }
  }

  "kgawsnyprod1-sg1" = {
    description = "EC2 Security Group 1"
    ingress = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["10.0.0.0/8"]
        description = "SSH from internal"
      }
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "All outbound"
      }
    ]
    tags = {
      Name = "ec2-sg-1"
    }
  }

  "kgawsnyprod1-sg2" = {
    description = "EC2 Security Group 2"
    ingress = [
      {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTP"
      }
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "All outbound"
      }
    ]
    tags = {
      Name = "ec2-sg-2"
    }
  }
}
