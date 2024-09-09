variable "ec2Name" {
  type = string
}

resource "aws_instance" "ec2" {
  ami           = "ami-09efc42336106d2f2"
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2Name
  }
}
