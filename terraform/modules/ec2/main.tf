resource "aws_instance" "public_ec2"{
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.public_subnet_ids
    vpc_security_group_ids = aws_security_group.public_security-group.id
    key_name = aws_key_pair.kp.key_name #key pair attach
    associate_public_ip_address = "true"
    user_data =file("./modules/ec2/public_user_data.sh")
    tags = {
        Name = "${var.ec2_Name}",
        created-by="maram hassan"
    }
    
}




resource "aws_security_group" "public_security-group" {
    name = "allow_http_ssh"
    vpc_id = var.vpc_id

    ingress {
        from_port   = var.ssh_port
        to_port     = var.ssh_port
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    

    ingress {
        from_port   = var.HTTP_port
        to_port     = var.HTTP_port
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
   

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}


# Generate a new RSA private key with a key size of 4096 bits
resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
# Create an AWS key pair using the generated public key
resource "aws_key_pair" "kp" {
  key_name   = var.key_Name      # Create "myKey" to AWS!!
  public_key = tls_private_key.pk.public_key_openssh



}

# Save the private key to a file locally (will be destroyed with the key_pair resource)
resource "local_file" "private_key" {
  content  = tls_private_key.pk.private_key_pem
  filename = "${path.cwd}/${var.key_Name}.pem"
  provisioner "local-exec" {
    command = <<EOT
    chmod 400 ${path.cwd}/${var.key_Name}.pem
    EOT
  }
}
