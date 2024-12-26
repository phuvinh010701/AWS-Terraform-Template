locals {
  cidr_block_dot = var.stage-name == "prod" ? 12 : (var.stage-name == "stg" ? 13 : 14)
}

resource "aws_vpc" "terraform-example" {
  cidr_block           = join(".", [10, local.cidr_block_dot, "0.0/20"])
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = format("terraform-example-%s", var.stage-name)
  }
}

resource "aws_subnet" "terraform-example-public-1" {
  vpc_id            = aws_vpc.terraform-example.id
  cidr_block        = format("10.%d.0.0/24", local.cidr_block_dot)
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = format("terraform-example-%s-public-1", var.stage-name)
  }
}

resource "aws_subnet" "terraform-example-public-2" {
  vpc_id            = aws_vpc.terraform-example.id
  cidr_block        = format("10.%d.1.0/24", local.cidr_block_dot)
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = format("terraform-example-%s-public-2", var.stage-name)
  }
}

resource "aws_internet_gateway" "terraform-example-ig" {
  vpc_id = aws_vpc.terraform-example.id
  tags = {
    Name = format("terraform-example-%s-ig", var.stage-name)
  }
}


resource "aws_route_table" "terraform-example-rt-public" {
  vpc_id = aws_vpc.terraform-example.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform-example-ig.id
  }
  tags = {
    Name = format("terraform-example-%s-rt-public", var.stage-name)
  }
}

resource "aws_route_table_association" "terraform-example-association-public-1" {
  route_table_id = aws_route_table.terraform-example-rt-public.id
  subnet_id      = aws_subnet.terraform-example-public-1.id
}

resource "aws_route_table_association" "terraform-example-association-public-2" {
  route_table_id = aws_route_table.terraform-example-rt-public.id
  subnet_id      = aws_subnet.terraform-example-public-2.id
}


resource "aws_security_group" "terraform-example-backend-lb-security-group" {
  name        = format("terraform-example-backend-lb-security-group-%s-sg", var.stage-name)
  description = "Security Group Load Balancer Backend"
  vpc_id      = aws_vpc.terraform-example.id
  ingress {
    from_port        = 0
    protocol         = "TCP"
    to_port          = 60000
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0
    protocol         = "-1"
    to_port          = 0
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
