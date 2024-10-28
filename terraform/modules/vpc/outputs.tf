
output "vpc_id" {
    value = aws_vpc.aws_vpc.id
}
output "public_subnet_ids" {
    description = "ID of the public subnets"
    value = aws_subnet.public_subnet.id
}
