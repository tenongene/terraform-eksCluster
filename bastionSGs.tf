#Security group for bastion host

module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"

  name        = "${local.name}-public-bastion-sg"
  description = "Security group for SSH ports open (IPv4) egress"
  vpc_id      = module.vpc.vpc_id

  #ingress rules
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  #egress rules
  egress_rules = ["all-all"]
  tags = local.common_tags
}