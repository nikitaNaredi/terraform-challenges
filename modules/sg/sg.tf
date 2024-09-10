variable "ingress" {
  type = list(number)
}

variable "egress" {
  type = list(number)
}

variable "name" {
  type = string
}

variable "cidr_blocks" {
  type = list(string)
}

resource "aws_security_group" "sg" {
  name = var.name
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress
    content {
      to_port     = port.value
      from_port   = port.value
      protocol    = "TCP"
      cidr_blocks = var.cidr_blocks
    }
  }
}

output "sg_name" {
  value = aws_security_group.sg.name
}
