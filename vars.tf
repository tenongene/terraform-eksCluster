#Input variables

#Aws Region

variable "aws_region" {
  description = "The targeted resource creation region"
  default = "us-east-2"
}

#Environmetn variables
variable "environment" {
  description = "environment variable used as prefix"
  type = string
  default = "dev"
}

#Business division
variable "business_division" {
  description = "Division"
  type = string
  default = "Accounting"
}