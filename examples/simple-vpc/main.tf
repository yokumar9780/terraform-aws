provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "C:\\Users\\yokum\\.aws\\credentials"
  profile                 = "default"
}

module "vpc" {
  source = "../../modules/vpc"

  name = "simple-example"

  vpc_idr_block = "10.0.0.0/16"

  availability_zones             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-name"
  }
}
