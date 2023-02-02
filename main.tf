

resource "aws_instance" "my_Ubuntu" {
  ami           = "ami-03e08697c325f02ab"
  instance_type = "t2.micro"

  tags = {
    Name    = "Terraform Ubuntu Server"
    Owner   = "Free"
    Project = "Terraform Lessons_1"
  }
}
