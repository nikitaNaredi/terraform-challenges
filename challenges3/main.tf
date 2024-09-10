module "security_groups" {
  source      = "../modules/sg"
  cidr_blocks = ["0.0.0.0/0"]
  name        = "nikita-sg"
  ingress     = [443]
  egress      = [8080]
}

module "db" {
  source  = "../modules/ec2"
  ec2Name = "db"
  sg_name = []
}

module "web" {
  source  = "../modules/ec2"
  ec2Name = "web"
  sg_name = [module.security_groups.sg_name]
}

resource "aws_eip" "web_ip" {
  instance = module.web.private_ip
}

output "privateIP" {
  value = module.web.private_ip
}

output "public_ip" {
  value = module.db.public_ip
}
