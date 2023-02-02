variable "aws_access_key" { 
default = "zerokey"
}
variable "aws_secret_key" {
default = "zerokey"
}
provider "aws" {
region = "eu-central-1"
access_key=var.aws_access_key
secret_key=var.aws_secret_key
}