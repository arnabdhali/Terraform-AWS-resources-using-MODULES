provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "tfvpc"{
  cidr_block           = "10.0.0.0/26"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {Name = "tfvpc"}
}

module "myEC2" {
  source = "../modules/ec2"
  vpc_id = aws_vpc.tfvpc.id
  cidr_block= "10.0.0.0/27"
  ami_id = "ami-081bb417559035fe8"
  instance_type = "t2.micro"
}

output "ec2_details" {
  value = module.myEC2.instance
}
