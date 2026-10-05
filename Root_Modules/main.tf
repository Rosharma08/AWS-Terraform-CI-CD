module "vpc" {

  source = "../ChildModules/VPC"

  vpc_cidr    = var.vpc_cidr
  environment = var.environment

}

module "public_subnet" {

  source = "../ChildModules/Subnet"

  vpc_id            = module.vpc.vpc_id
  subnet_cidr       = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  environment       = var.environment
  subnet_name       = "public-subnet"

}

resource "aws_internet_gateway" "this" {

  vpc_id = module.vpc.vpc_id

  tags = {

    Name        = "${var.environment}-igw"
    Environment = var.environment

  }

}

resource "aws_route_table" "public" {

  vpc_id = module.vpc.vpc_id

  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id

  }

  tags = {

    Name        = "${var.environment}-public-rt"
    Environment = var.environment

  }

}

resource "aws_route_table_association" "public" {

  subnet_id      = module.public_subnet.subnet_id
  route_table_id = aws_route_table.public.id

}

module "ec2_sg" {

  source = "../ChildModules/Security_Group"

  vpc_id              = module.vpc.vpc_id
  environment         = var.environment
  security_group_name = "ec2"
  description         = "Security group for public EC2"
  allowed_egress_cidr = "0.0.0.0/0"

  ingress_rules = [

    {
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      cidr      = "0.0.0.0/0"
    },

    {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
      cidr      = "0.0.0.0/0"
    }

  ]

}

module "ec2" {

  source = "../ChildModules/EC2"

  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.public_subnet.subnet_id
  security_group_id = module.ec2_sg.security_group_id
  key_name          = var.key_name
  environment       = var.environment
  instance_name     = "web-server"

}