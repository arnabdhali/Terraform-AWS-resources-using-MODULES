resource "aws_subnet" "tfsubnet" {
  availability_zone = "ap-south-1a"
  cidr_block        = var.cidr_block
  vpc_id            = var.vpc_id
}

resource "aws_instance" "tfec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.tfsubnet.id
  vpc_security_group_ids = [module.mySG.securitygroup.id]
  tags                   = {Name = "tfEC2"}
}

module "mySG" {		 
  source = "../sg/"
  vpc_id = var.vpc_id
}

output "instance" {
  value = aws_instance.tfec2
  description = "tfEC2 details"
}

