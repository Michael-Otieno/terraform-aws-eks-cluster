resource "aws_security_group_rule" "allow_nodeports" {
  count = var.enable_nodeport_ingress && var.nodeport_target_sg_id != null && var.nodeport_target_sg_id != "" ? 1 : 0

  type        = "ingress"
  from_port   = 30000
  to_port     = 32767
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  description       = "Allow all Kubernetes NodePorts"
  security_group_id = var.nodeport_target_sg_id
}