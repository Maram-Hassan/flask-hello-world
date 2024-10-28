 # vpc 
  vpc_Name = "MYVPC"
  vpc_cidr_block = "10.0.0.0/16"
  public_subnets_cidr = "10.0.1.0/24"
  availability_Zones_subnet = "us-east-1a"  # us-east-1a
#ec2
  ec2_Name = "terraforminstance"
  ami_id = "ami-0e86e20dae9224db8"   # ami-0e86e20dae9224db8
  key_Name = "private_key"
  instance_types = "t2.micro" # t2.micro