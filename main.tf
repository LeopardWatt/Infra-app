# Configure Terraform AWS Version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.44.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
}

# Create a VPC_AZ1
resource "aws_vpc" "like_home_vpc" {
  cidr_block = "192.168.112.0/24"
  tags = {
  Name = "like-home"
  }
}

# Create a Subnet_AZ1
resource "aws_subnet" "like_home_subnet" {
  vpc_id            = "${aws_vpc.like_home_vpc.id}"
  cidr_block        = "192.168.112.0/24"
  availability_zone = "eu-central-1a"

  tags = {
  Name = "like-home"
  }
}

# Connect EC2 to Network_AZ1
resource "aws_network_interface" "like_home_interface" {
  subnet_id   = "${aws_subnet.like_home_subnet.id}"
  private_ips = ["192.168.112.100"]

  tags = {
  Name = "primary_network_interface"
  }
}


# 01_Create a EC2 Bastion_Instance
resource "aws_instance" "Bastion_Instance" {
  ami           = "ami-03e08697c325f02ab"
  instance_type = "t2.micro"

  network_interface {
  network_interface_id = "${aws_network_interface.like_home_interface.id}"
  device_index         = 0
  }

  tags = {
    Name    = "Bastion_Instance"
    Owner   = "Leopard"
    Project = "Terraform Lessons_1"
  }
}

# 02_Create a EC2 CI_CD-instance
resource "aws_instance" "CI_CD-Instance" {
  ami           = "ami-03e08697c325f02ab"
  instance_type = "t2.micro"

  network_interface {
  network_interface_id = "${aws_network_interface.like_home_interface.id}"
  device_index         = 0
  }

  tags = {
    Name    = "CI_CD-Instance"
    Owner   = "Leopard"
    Project = "Terraform Lessons_1"
  }
}

# 03_Create a EC2 Working_Horse
resource "aws_instance" "Working_Horse" {
  ami           = "ami-03e08697c325f02ab"
  instance_type = "t2.micro"

  network_interface {
  network_interface_id = "${aws_network_interface.like_home_interface.id}"
  device_index         = 0
  }

  tags = {
    Name    = "Working_Horse"
    Owner   = "Leopard"
    Project = "Terraform Lessons_1"
  }
}