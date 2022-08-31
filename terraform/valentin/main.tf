terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

data "aws_vpcs" "my_vpcs" {
}

data "aws_security_groups" "sgr1" {
  tags = {
    open = "ssh"
  }
}

output "sg" {
  value = data.aws_security_groups.sgr1.ids
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-*"]
  }


  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "valentin_ubuntu" {
  ami                         = data.aws_ami.ubuntu.image_id
  instance_type               = "t3.micro"
  key_name                    = "Valentin"
  vpc_security_group_ids      = data.aws_security_groups.sgr1.ids
  associate_public_ip_address = true

  tags = {
    Name = "ValentinEC2"
  }
}

data "aws_subnets" "ubuntu" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.my_vpcs.ids[0]]
  }
}
