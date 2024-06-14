provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "your-ami-id"
  instance_type = "t2.micro"
  tags = {
    Name = "ExampleInstance"
  }
}

terraform {
  backend "s3" {
    bucket = "your-bucket-name"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}