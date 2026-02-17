resource "aws_eip" "bastion_eip" {
  depends_on = [module.ec2_public, module.vpc] # created after ec2 and vpc are created
  instance   = module.ec2_public.id
  domain     = "vpc"
  tags       = local.common_tags
}