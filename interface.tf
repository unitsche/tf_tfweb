variable "region" {
  description = "The AWS region."
}

variable "environment" {
  description = "The name of our environment, i.e. development."
}

variable "key_name" {
  description = "The AWS key pair to use for resources."
}

variable "public_subnet_ids" {
  default     = []
  description = "The list of public subnets to populate."
}

variable "private_subnet_ids" {
  default     = []
  description = "The list of private subnets to populate."
}

variable "ami" {
  default = {
  "eu-central-1" = "ami-8504fdea"
  "us-west-1"    = "ami-0d77397e"
  }

  description = "The AMIs to use for web and app instances."
}

variable "instance_type" {
  default     = "t2.micro"
  description = "The instance type to launch "
}

variable "web_instance_count" {
  default     = 1
  description = "The number of Web instances to create"
}

variable "app_instance_count" {
  default     = 1
  description = "The number of App instances to create"
}

variable "vpc_id" {
  description = "The VPC ID to launch in"
}

variable "domain" {
  description = "The domain to use for the web service"
}

output "web_elb_address" {
  value = "${aws_elb.web.dns_name}"
}

output "web_host_addresses" {
  value = ["${aws_instance.web.*.private_ip}"]
}

output "app_host_addresses" {
  value = ["${aws_instance.app.*.private_ip}"]
}
