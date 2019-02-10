######################
# Declare Variables  #
######################
variable "aws_region" {
 }
variable "shared_credentials_file" {
}
variable "profile" {
  default     = "default"
}

variable "availability_zone" {
  type = "list"
  description = "A list of availability zones in the region"
  default     = []
}

variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  default     = true
}

variable "manage_default_vpc" {
  description = "Should be true to adopt and manage Default VPC"
  default     = false
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  default     = false
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  default     = true
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}

variable "tags" {
  type = "map"
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "vpc_tags" {
  type = "map"
  description = "Additional tags for the VPC"
  default     = {}
}

variable "map_public_ip_on_launch" {
  description = "Should be false if you do not want to auto-assign public IP on launch"
  default     = true
}

variable "ec2_public_key" {
}

variable vpc_idr_block {
  type = "string"
}

variable "public_subnets" {
  type = "list"
  description = "A list of public subnets inside the VPC"
  default     = []
}

variable "public_subnet_tags" {
  type = "map"
  description = "Additional tags for the public subnets"
  default     = {}
}

variable "private_subnets" {
  type = "list"
  description = "A list of private subnets inside the VPC"
  default     = []
}
variable "private_subnet_tags" {
  type = "map"
  description = "Additional tags for the private subnets"
  default     = {}
}
variable "public_subnet_suffix" {
}

variable "public_route_table_tags" {
  type = "map"
  description = ""
  default     = {}
}



variable "private_subnet_suffix" {
}

variable "private_route_table_tags" {
  type = "map"
  description = ""
  default     = {}
}

variable "igw_tags" {
  type = "map"
  description = "Additional tags for the internet gateway"
  default     = {}
}

variable "one_nat_gateway_per_az" {
  description = "Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`."
  default     = false
}

variable "reuse_nat_ips" {
  description = "Should be true if you don't want EIPs to be created for your NAT Gateways and will instead pass them in via the 'external_nat_ip_ids' variable"
  default     = false
}

variable "external_nat_ip_ids" {
  description = "List of EIP IDs to be assigned to the NAT Gateways (used in combination with reuse_nat_ips)"
  type        = "list"
  default     = []
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  default     = false
}
variable "nat_eip_tags" {
  type = "map"
  description = "Additional tags for the NAT EIP"
  default     = {}
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = false
}
variable "nat_gateway_tags" {
  type = "map"
  description = "Additional tags for the NAT gateways"
  default     = {}
}

variable "enable_s3_endpoint" {
  description = "Should be true if you want to provision an S3 endpoint to the VPC"
  default     = false
}

variable "enable_vpn_gateway" {
  description = "Should be true if you want to create a new VPN Gateway resource and attach it to the VPC"
  default     = false
}

variable "vpn_gateway_tags" {
  type = "map"
  description = "Additional tags for the VPN gateway"
  default     = {}
}

variable "vpn_gateway_id" {
  description = "ID of VPN Gateway to attach to the VPC"
  default     = ""
}

variable "amazon_side_asn" {
  description = "The Autonomous System Number (ASN) for the Amazon side of the gateway. By default the virtual private gateway is created with the current default Amazon ASN."
  default     = "64512"
}
variable "propagate_private_route_tables_vgw" {
  description = "Should be true if you want route table propagation"
  default     = false
}

variable "propagate_public_route_tables_vgw" {
  description = "Should be true if you want route table propagation"
  default     = false
}

variable "enable_ec2_endpoint" {
  description = "Should be true if you want to provision an EC2 endpoint to the VPC"
  default     = false
}

variable "ec2_endpoint_security_group_ids" {
  type = "list"
  description = "The ID of one or more security groups to associate with the network interface for EC2 endpoint"
  default     = []
}

variable "ec2_endpoint_private_dns_enabled" {

  description = "Whether or not to associate a private hosted zone with the specified VPC for EC2 endpoint"
  default     = false
}

variable "ec2_endpoint_subnet_ids" {
  type = "list"
  description = "The ID of one or more subnets in which to create a network interface for EC2 endpoint. Only a single subnet within an AZ is supported. If omitted, private subnets will be used."
  default     = []
}