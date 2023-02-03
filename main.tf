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
resource "aws_vpc" "like_home" {
  cidr_block = "192.168.0.0/25"
}
# Create a EC2
resource "aws_instance" "My_Ubuntu_Terraform" {
  ami           = "ami-03e08697c325f02ab"
  instance_type = "t2.micro"

  tags = {
    Name    = "Terraform Ubuntu Server"
    Owner   = "Free"
    Project = "Terraform Lessons_1"
  }
}
