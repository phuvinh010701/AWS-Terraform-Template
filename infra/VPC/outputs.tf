output "vpc-id" {
  value = aws_vpc.terraform-example.id
}

output "subnet-public-1-id" {
  value = aws_subnet.terraform-example-public-1.id
}

output "subnet-public-2-id" {
  value = aws_subnet.terraform-example-public-2.id
}
output "terraform-example-backend-lb-security-group" {
  value = aws_security_group.terraform-example-backend-lb-security-group.id
}