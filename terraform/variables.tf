variable "vpc_Name" {
    description = "Name of the VPC."
    type = string
}

variable "vpc_cidr_block" {
    description = "CIDR block for the VPC."
    type = string
}

variable "public_subnets_cidr" {
    description = "CIDR blocks for public subnets."
    type = string
}

variable "availability_Zones_subnet" {
    description = " Availability Zones for subnets."
    type = string
}

variable "ec2_Name" {
    description = "Name of the EC2 instance."
    type = string
}

variable "ami_id" {
    description = "AMI ID for the EC2 instance."
    type = string
}

variable "instance_types" {
    description = "Type of EC2 instance."
    type = string
}

variable "key_Name" {
    description = "SSH key pair name for instance access."
    type = string
}

