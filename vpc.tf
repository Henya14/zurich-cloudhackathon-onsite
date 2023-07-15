resource "aws_vpc" "ec2_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames  = true
    enable_dns_support = true
    tags = {
        "Name" = "ec2-vpc" 
    }
}

resource "aws_subnet" "ec2_subnet" {
    cidr_block = "${cidrsubnet(aws_vpc.ec2_vpc.cidr_block, 3, 1)}"
    vpc_id = aws_vpc.ec2_vpc.id
    availability_zone = "${var.aws_region}a"
}

resource "aws_security_group" "ec2_security_group" {
    for_each = var.sec_group_config
    name = "${each.key}"
    vpc_id = aws_vpc.ec2_vpc.id
    description = "The security group for ${each.key}"

    dynamic "ingress" {
        for_each = each.value.ingress_configs

        content {
             cidr_blocks = ["0.0.0.0/0"]
             from_port = ingress.value.port 
             to_port = ingress.value.port
             protocol = ingress.value.protocol
        }
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = -1
        cidr_blocks = ["0.0.0.0/0"]
    } 
}


resource "aws_eip" "elastic_ip_for_ec2_instance1" {
  instance = "${aws_instance.ec2_instance1.id}"
  vpc      = true
}

resource "aws_eip" "elastic_ip_for_ec2_instance2" {
  instance = "${aws_instance.ec2_instance2.id}"
  vpc      = true
}

resource "aws_internet_gateway" "ec2_vpc_gateway" {
  vpc_id = "${aws_vpc.ec2_vpc.id}"
tags = {
    Name = var.vpc_gateway_name
  }
}

resource "aws_route_table" "ec2_route_table" {
  vpc_id = "${aws_vpc.ec2_vpc.id}"
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ec2_vpc_gateway.id}"
  }
tags =  {
    Name = var.vpc_route_table_name
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = "${aws_subnet.ec2_subnet.id}"
  route_table_id = "${aws_route_table.ec2_route_table.id}"
}