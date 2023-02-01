#Availability zone datasource
data "aws_availability_zones" "available" {
  # state = "available"
}

#create vpc module

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "tenon-vpc"
  cidr = "10.0.0.0/16"

  # azs             = ["us-east-2a", "us-east-2b"]
  azs = data.aws_availability_zones.available.names
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  #database subnets
  database_subnets = ["10.0.151.0/24", "10.0.152.0/24"]
  create_database_subnet_group = true
  create_database_subnet_route_table = true

  #connectivity for private subnet
  enable_nat_gateway = true

  #DNS Parameters
  enable_dns_support = true
  enable_dns_hostnames = true

  #tags
  public_subnet_tags = {
    type = "public-subnets"
    "kubernetes.io/role/elb" = 1
    "kubertnetes.io/cluster/${local.eks_cluster_name}" = "shared"
  }
  private_subnet_tags = {
    type = "private-subnets"
    "kubernetes.io/role/elb" = 1
    "kubertnetes.io/cluster/${local.eks_cluster_name}" = "shared"
  }
  database_subnet_tags = {
    type = "database-subnets"
  }

  tags = {
    owner = "tenongene"
    environment = "dev"
  }

  vpc_tags = {
    name = "vpc-dev"
  }
}