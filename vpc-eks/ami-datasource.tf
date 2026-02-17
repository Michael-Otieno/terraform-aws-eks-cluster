data "aws_ami" "amzlinux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"] # Amazon Linux 2 AMI name pattern
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"] # only EBS backed AMIs
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"] # HVM virtualization
  }
  filter {
    name   = "architecture"
    values = ["x86_64"] # x86_64 architecture
  }
}