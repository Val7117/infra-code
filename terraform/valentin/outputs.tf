output "my_vpcs" {
  value = data.aws_vpcs.my_vpcs.ids
}

output "sgr1" {
<<<<<<< HEAD
  value = data.aws_security_groups.sgr1.ids
=======
  value = data.aws_security_groups.test.ids
>>>>>>> 08ea1ed6ba0bc2b94a3903bbff0f406da9d66f25
}

output "ami" {
  value = data.aws_ami.ubuntu.image_id
}

