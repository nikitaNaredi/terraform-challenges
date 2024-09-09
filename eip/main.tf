provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "niki-ec2" {
  ami           = "ami-09efc42336106d2f2"
  instance_type = "t2.micro"
}

resource "aws_eip" "eip" {
  instance = aws_instance.niki-ec2.id
}

output "eip_id" {
  value = aws_eip.eip.public_ip
}
