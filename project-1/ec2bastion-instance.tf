module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.1.4"
  # insert the required variables here
  name          = "${local.name}-BastionHost"
  ami           = data.aws_ami.amzlinux.id # Amazon Linux AMI
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  subnet_id              = module.vpc.public_subnets[0]                 # Deploy in the first public subnet
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id] # Attach the Bastion Security Group
  #   associate_public_ip_address = true # Assign a public IP address
  tags = local.common_tags
}