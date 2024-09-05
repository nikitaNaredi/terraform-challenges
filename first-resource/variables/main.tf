provider "aws" {
  region = "us-east-2"
}

variable "vpcname" {
  type    = string
  default = "myvpc"
}

variable "inputname" {
  type = string
}

variable "count" {
  type    = number
  default = 2
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  count      = var.count
  tags = {
    Name = var.inputname
  }
}

output "myoutput" {
  value = aws_vpc.myvpc.id
}
