

resource "aws_instance" "My_Ubuntu_Terraform" {
  ami           = "ami-03e08697c325f02ab"
  instance_type = "t2.micro"

  tags = {
    Name    = "Terraform Ubuntu Server"
    Owner   = "Free"
    Project = "Terraform Lessons_1"
  }
}
