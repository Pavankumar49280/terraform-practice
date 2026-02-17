resource "aws_vpc" "myvpc" {
  tags = {
    Name = "Terraform-VPC"
  }
  cidr_block           = "10.0.0.0/21"
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"
}

resource "aws_subnet" "mysubnet" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "Terraform-subnet"
  }
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.1.0/24"
}

resource "aws_internet_gateway" "myigw" {
  tags = {
    Name = "TerraIGW"
  }
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "myrt" {
  tags = {
    Name = "TerraRT"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
    vpc_id     = aws_vpc.myvpc.id
  
}
resource "aws_route_table_association" "myrtass" {
  subnet_id   = aws_subnet.mysubnet.id
  route_table_id = aws_route_table.myrt.id
}

