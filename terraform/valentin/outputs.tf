output "my_vpcs" {
  value = data.aws_vpcs.my_vpcs.ids
}

output "sgr1" {
  value = data.aws_security_groups.test.ids
}

output "ami" {
  value = data.aws_ami.ubuntu.image_id
}

