provider "aws" {
  access_key = "AKIAXCBFWQIANA6LO5MW"
  secret_key = "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"
  region     = "us-east-1"
}
data "aws_vpc" "vpc_data" {
  default = true
}

resource "aws_instance" "one-ec2" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  tags = {
    Name      = "instance-1"
    creater   = "sandeep"
    createdOn = "terraform"
  }
}
resource "aws_instance" "two-ec2" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  tags = {
    Name      = "instance-2"
    creater   = "sandeep"
    createdOn = "terraform"
  }
}
output "vpc" {
  value = data.aws_vpc.vpc_data
}