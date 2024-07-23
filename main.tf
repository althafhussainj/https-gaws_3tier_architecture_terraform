provider "aws" {
  region = "ap-south-1"
}

# Define an AWS EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0ad21ae1d0696ad58"
  instance_type = "t2.micro"
}