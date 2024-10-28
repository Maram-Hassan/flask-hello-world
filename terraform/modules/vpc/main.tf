# Create vpc with specific cider block 
resource "aws_vpc" "aws_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_Name,
  }
}

# Create public subnets with specific cider block 
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.aws_vpc.id
  cidr_block =var.public_subnets_cidr
  availability_zone = var.availability_Zones_subnet


}


# Create an internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id =  aws_vpc.aws_vpc.id

  tags = {
    Name = "IGW-${var.vpc_Name}"
  }

}

# Create a route table for public subnets
resource "aws_route_table" "public_route_table" {
  vpc_id =  aws_vpc.aws_vpc.id
  

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway[0].id
  }

  tags = {
    Name = "terraform_routeTable${var.vpc_Name}"
  }
}



# Associate public subnets with the public route table
resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
  
}
