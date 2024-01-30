output "public_dns" {
  value = aws_instance.bastion.public_dns
}

output "public_ip" {
  value = aws_instance.bastion.public_ip
}

output "instance_id" {
  value = aws_instance.bastion.id
}

