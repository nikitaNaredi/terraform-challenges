provider "aws" {
  region = "us-east-2"
}

module "ec2" {
  source  = "./ec2"
  ec2Name = "Name of ec2"
}
