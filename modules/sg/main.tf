resource "aws_security_group" "tfSG" {
  vpc_id  = var.vpc_id
  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"
      cidr_blocks = ingress.value
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {Name = "tfSG"}
}

output "securitygroup" {
  value = aws_security_group.tfSG
  description = "tfSG details"
}

