provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  tags = {
    Name = "ExampleInstance"
  }
}

terraform {
  backend "s3" {
    bucket = "my-bucket-jenkins-terraform-aws"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}