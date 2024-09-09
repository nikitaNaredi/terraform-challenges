provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "db" {
  tags = {
    name = "db"
  }
  ami           = "ami-09efc42336106d2f2"
  instance_type = "t2.micro"
}

resource "aws_instance" "web" {
  tags = {
    name = "web"
  }
  ami           = "ami-09efc42336106d2f2"
  instance_type = "t2.micro"
  #   security_groups = [aws_security_group.sg.name]
}

resource "aws_eip" "web_ip" {
  instance = aws_instance.web.id
}

variable "ingress" {
  type    = list(number)
  default = [80, 443]
}

variable "egress" {
  type    = list(number)
  default = [80, 443, 8080]
}

resource "aws_security_group" "sg" {
  name = "Allow https"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress
    # var.ingress
    content {
      to_port     = port.value
      from_port   = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress
    # var.egress
    content {
      to_port     = port.value
      from_port   = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "privateIP" {
  value = aws_instance.db.private_ip
}

output "public_ip" {
  value = aws_eip.web_ip.public_ip
}
