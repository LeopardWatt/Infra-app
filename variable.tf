variable "aws_access_key" { 
default = "AKIA36AADS5SO4CfhfhgT2GX2"
}
variable "aws_secret_key" {
default = "FQD5D8MqRbdOrAaGvJrW8kAO8rZqDEykfhfgh94bLtPKT"
}
provider "aws" {
region = "eu-central-1"
access_key=var.aws_access_key
secret_key=var.aws_secret_key
}