#bastion outputs

output "bastion_public_instance_ids" {
  description = "List of instance IDs"
  value = module.ec2_public.id
}

output "ec2_bastion_eip" {
  description = "Elastic IP associated with bastion host"
  value = aws_eip.bastion_eip.public_ip
}