provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "C:\\Users\\yokum\\.aws\\credentials"
  profile                 = "default"
}
data "aws_security_group" "default" {
  name   = "default"
  vpc_id = "${module.vpc.vpc_id}"
}

module "vpc" {
  source = "../../modules/vpc"
  name = "complete-example"
  vpc_idr_block = "10.10.0.0/16"

  availability_zones  = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets     = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  public_subnets      = ["10.10.11.0/24", "10.10.12.0/24", "10.10.13.0/24"]

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_vpn_gateway = true
  propagate_public_route_tables_vgw="true"
  propagate_private_route_tables_vgw="true"

  # VPC endpoint for S3
  enable_s3_endpoint = true

  # VPC Endpoint for EC2
  enable_ec2_endpoint              = true
  ec2_endpoint_private_dns_enabled = true
  ec2_endpoint_security_group_ids  = ["${data.aws_security_group.default.id}"]
  tags = {
    Owner       = "user"
    Environment = "staging"
    Name        = "complete"
  }
}
