# Configure Terraform AWS Version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.44.0"
    }
  }
  # tfenv list | tfenv use 1.3.6
  required_version = ">=1.1.0, <=1.3.6"
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
  default_tags {
    tags = {
      Purpose = "Terraform hometask"
    }
  }
}

# Create a VPC
resource "aws_vpc" "main" {
 cidr_block = "192.168.0.0/25"
 enable_dns_hostnames = true
 enable_dns_support = true
 
 tags = {
   Name = "Project VPC"
 }
}

# Create Public Subnet
variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["192.168.0.0/26"]
}

# Create Private Subnet
variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
 default     = ["192.168.0.64/26"]
}

# Create Internet Gateway for Public Subnet
resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.main.id
 
 tags = {
   Name = "Project VPC Internet Gateway"
 }
}

# Create NAT_gateway for Private Subnet
#resource "aws_nat_gateway" "gw"  {
 # allocation_id = "aws_vpc" "main"        
  #subnet_id     = aws_subnet.example.id

  #tags = {
  #  Name = "Project VPC NAT Gateway"
  #}
#}

# 01_Create a EC2 Bastion_Instance
resource "aws_instance" "Bastion_Instance" {
  ami           = "ami-03e08697c325f02ab"
  instance_type = "t2.micro"
  #private_ip = "192.168.0.70"

  #network_interface {
  #network_interface_id = "${aws_network_interface.like_home_interface.id}"
  #device_index         = 0
  #}

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
  #private_ip = "192.168.0.80"

  #network_interface {
  #network_interface_id = "${aws_network_interface.like_home_interface.id}"
  #device_index         = 0
  #}

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
  #private_ip = "192.168.0.90"

  #network_interface {
  #network_interface_id = "${aws_network_interface.like_home_interface.id}"
  #device_index         = 0
  #}

  tags = {
    Name    = "Working_Horse"
    Owner   = "Leopard"
    Project = "Terraform Lessons_1"
  }
}