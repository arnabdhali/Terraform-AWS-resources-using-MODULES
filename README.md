# Terraform-AWS-resources-using-MODULES
Terraform AWS VPC Subnet EC2 SG using Modules




This example show the usage of modules and for_each loop usage in security groups.

Heirarchy
main.tf -> has "aws_vpc" resource & call ec2 MODULE for creating EC2 instance. output the details of ec2 instance
modules
   |----ec2
           |---- main.tf      has "aws_subnet" & "aws_instance" resources. "aws_instance" call sg MODULE for creating security group
           |---- vars.tf
   |----sg
           |---- main.tf      has "aws_security_group" resource. demo of for_each loop usage here.
           |---- vars.tf
