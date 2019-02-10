## setup data using AWS AMI(Amazon Machine Image)
data "aws_ami" "ubuntu-test01" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server*"]
  }
}
## EC2 key settings
resource "aws_key_pair" "key-env-test01" {
  count = "0"
  key_name   = "id_rsa_ec2test01"
  public_key = "${var.ec2_public_key}"
}

resource "aws_instance" "env-test01" {
  count = "0"
  ami           = "${data.aws_ami.ubuntu-test01.id}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.key-env-test01.id}"

  tags {
    Name = "env-test01"
  }

  subnet_id = "${aws_subnet.public.id}"
}
