variable "instance_type" {
  description = "Specifies the type of EC2 instance to be launched."
  type = string
  
}
variable "ec2_Name" {
  description = "The name assigned to the EC2 instance."
  type = string
}

variable "ami_id" {
  description = "The Amazon Machine Image (AMI) ID"
  type = string
   
}
variable "public_subnet_ids" {
    description = "A list of public subnet IDs where the EC2 instance will be deployed."
    type = string
   
}

variable "ssh_port" {
  description = "The port used for SSH access to the EC2 instance."
  type = number
  default = 22
  
}
variable "HTTP_port" {
  description = "The port used for HTTP traffic to the EC2 instance."
  type = number
  default = 80
}


variable "vpc_id" {
  description = "The port used for HTTP traffic to the EC2 instance."
  type = string
}


variable "key_Name" {
  description = "The name of the AWS key pair used to connect to the EC2 instance."
  type = string
}