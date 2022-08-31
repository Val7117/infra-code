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

<<<<<<< HEAD
data "aws_security_groups" "sgr1" {
=======
data "aws_security_groups" "test" {
>>>>>>> 08ea1ed6ba0bc2b94a3903bbff0f406da9d66f25
  tags = {
    open = "ssh"
  }
}

output "sg" {
<<<<<<< HEAD
  value = data.aws_security_groups.sgr1.ids
=======
  value = data.aws_security_groups.test.ids
>>>>>>> 08ea1ed6ba0bc2b94a3903bbff0f406da9d66f25
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
<<<<<<< HEAD
  vpc_security_group_ids      = data.aws_security_groups.sgr1.ids
=======
  vpc_security_group_ids      = data.aws_security_groups.test.ids
>>>>>>> 08ea1ed6ba0bc2b94a3903bbff0f406da9d66f25
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
