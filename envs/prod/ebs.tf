module "ebs_volumes" {
  source = "../../modules/ebs"

  # Example volumes for each EC2 instance
  volumes = [
    # Volumes for EC2 instance 1
    { instance_id = module.ec2_instance["kgawsnyprod1"].id, availability_zone = module.ec2_instance["kgawsnyprod1"].availability_zone, size = 20, type = "gp3", device_name = "/dev/sdf", encrypted = false, tags = { Name = "AppVolume-1" } },
    { instance_id = module.ec2_instance["kgawsnyprod1"].id, availability_zone = module.ec2_instance["kgawsnyprod1"].availability_zone, size = 30, type = "gp3", device_name = "/dev/sdg", encrypted = false, tags = { Name = "DBVolume-1" } },
    
    # Volumes for EC2 instance 2
    #{ instance_id = module.ec2_instances.instance_ids[1], size = 20, type = "gp3", device_name = "/dev/sdh", encrypted = false, tags = { Name = "AppVolume-2" } },
    #{ instance_id = module.ec2_instances.instance_ids[1], size = 30, type = "gp3", device_name = "/dev/sdi", encrypted = false, tags = { Name = "DBVolume-2" } },
    
    # Volumes for EC2 instance 3
    #{ instance_id = module.ec2_instances.instance_ids[2], size = 20, type = "gp3", device_name = "/dev/sdk", encrypted = false, tags = { Name = "AppVolume-3" } }
  ]
}


