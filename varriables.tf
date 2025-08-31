variable "aws_region" {
  default = "us-east-1"
  type    = string
}

variable "vpc_cidr" {

  default = "10.0.0.0/16"
  type    = string
}

variable "subnet_cidr" {

  default = "10.0.0.0/24"
  type    = string
}

variable "ami" {

  default = "ami-0360c520857e3138f"
  type    = string
}

variable "instance_type" {

  default = "t2.micro"
  type    = string
}

variable "key_name" {
  default = "ayush-cicd-key"
  type    = string
}