# Complete VPC

Configuration in this directory creates set of VPC resources which may be sufficient for staging or production environment.

There are public, private subnets, and NAT Gateways created in each availability zone.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money (AWS Elastic IP, for example). Run `terraform destroy` when you don't need these resources.

