terraform {
  backend "remote" {
    organization = "Datagrokr_sandeep"

    workspaces {
      name = "terraform-vcs-datagrokr"
    }
  }


}

provider "aws" {
  region = "us-east-1"
}
data "aws_vpc" "vpc_data" {
  default = true
}

resource "aws_instance" "one-ec2-one" {
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