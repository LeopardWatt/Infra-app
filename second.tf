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

# Create Internet Gateway
resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.main.id
 
 tags = {
   Name = "Project VPC Internet Gateway"
 }
}

# Create NAT_gateway
resource "aws_nat_gateway" "gw"  {
  allocation_id = "aws_vpc" "main"        
  subnet_id     = aws_subnet.example.id

  tags = {
    Name = "Project VPC NAT Gateway"
  }
}