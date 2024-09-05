provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "vpc-new" {
  cidr_block = "192.168.0.0/24"
}
