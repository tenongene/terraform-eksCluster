module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"

  name = "${local.name}-bastionHost"

  ami                    = "ami-05bfbece1ed5beb54"
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
 
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = local.common_tags
}