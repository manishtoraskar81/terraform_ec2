################################################################################
# FSx OnTap for AWS Region <--- Replace this section with the region name --->
################################################################################

# Global
aws_region          = "xxxx" // AWS Region where the resources are deployed
vpc_id              = "xxxx" // The ID of the VPC where the resources are deployed
subnet_ids          = ["xxxx", "xxxx"] // A list of IDs for the subnets that the file system will be accessible from
preferred_subnet_id = "xxxx" // The ID for the preferred subnet (FSX primary subnet)

additional_tags = {
    Env            = "prod"
    Owner          = "dl-kering-global-oi-ops-system-at-kering.com"
    Project        = "FSx OnTap"
    Support        = "Fujitsu"
    TeamName       = "Kering Technologies"
}

# File system (fs)
fs_name                          = "xxxx" // The name of the file system (fs)
fs_endpoint_ip_address_range     = "xxxx" // FSx endpoint IP address range attached to the VPC
fs_weekly_maintenance_start_time = "xxxx" // d:HH:MM format
fs_throughput_capacity           = "xxxx" // Throughput capacity (in MBps) for the file system
fs_storage_capacity              = "xxxx" // The storage capacity (GB) of the file system
