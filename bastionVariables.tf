variable "instance_type" {
  description = "EC2 Instance type"  
  type = string
  default = "t3.micro"
}

variable "instance_keypair" {
  description = "AWS EC2 Key pair for instance"
  type = string
  default = "eks-terraform-key"
}