resource "aws_vpc" "customer_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    "Name" = "customerapi_vpc"
  }
}

resource "aws_subnet" "customer_subnet" {
  vpc_id                  = aws_vpc.customer_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "customerapi_subnet"
  }
}

resource "aws_internet_gateway" "customer_igw" {
  vpc_id = aws_vpc.customer_vpc.id

  tags = {
    Name = "customerapi_igw"
  }
}

resource "aws_route_table" "customer_rtb" {
  vpc_id = aws_vpc.customer_vpc.id

  tags = {
    Name = "customerapi_rtb"
  }
}

resource "aws_route" "customer_route" {
  route_table_id         = aws_route_table.customer_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.customer_igw.id
}

resource "aws_route_table_association" "customer_rtb_ass" {
  route_table_id = aws_route_table.customer_rtb.id
  subnet_id      = aws_subnet.customer_subnet.id
}

resource "aws_instance" "customer_ec2" {
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.customer_key.id
  vpc_security_group_ids = [aws_security_group.customer_sg.id]
  subnet_id              = aws_subnet.customer_subnet.id

  ami = data.aws_ami.customer_ami.id

  user_data = file("userdata.tpl")

  root_block_device {
    volume_size = 8
  }

  tags = {
    Name = "customerapi_ec2"
  }
}


