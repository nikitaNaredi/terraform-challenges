variable "ec2Name" {
  type = string
}

variable "sg_name" {
  type = list(string)
}

resource "aws_instance" "ec2" {
  ami             = "ami-09efc42336106d2f2"
  instance_type   = "t2.micro"
  security_groups = var.sg_name
  tags = {
    Name = var.ec2Name
  }
}

output "public_ip" {
  value = aws_instance.ec2.public_ip
}

output "private_ip" {
  value = aws_instance.ec2.private_ip
}
