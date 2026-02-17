module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.1"

  name        = "${local.name}-public-bastion-sg"
  description = "Security group for ssh port open for everyone (IPv4 CIDR), egress ports are all world open"
  # why vpc_id from module.vpc?
  # because we need to associate the security group with the VPC created in the VPC module
  vpc_id = module.vpc.vpc_id

  # Ingress Rules and CIDR blocks
  ingress_rules       = ["ssh-tcp"]   # allow inbound SSH
  ingress_cidr_blocks = ["0.0.0.0/0"] # from anywhere (IPv4)

  # Egress Rules and CIDR blocks
  egress_rules = ["all-all"] # allow all outbound traffic
  tags         = local.common_tags
}