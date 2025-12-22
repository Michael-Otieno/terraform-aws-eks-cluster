# VPC Name
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "myvpc"
}

# VPC CIDR Block
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# VPC Public Subnet CIDR Blocks
variable "vpc_public_subnets" {
  description = "A list of CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

# VPC Private Subnet CIDR Blocks
variable "vpc_private_subnets" {
  description = "A list of CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

# VPC Datatbase Subnet CIDR Blocks
variable "vpc_database_subnets" {
  description = "A list of CIDR blocks for the database subnets"
  type        = list(string)
  default     = ["10.0.151.0/24", "10.0.152.0/24"]
}

# VPC Create Database Subnet Group (True/False)
variable "vpc_create_database_subnet_group" {
  description = "Whether to create a database subnet group"
  type        = bool
  default     = true
}

# VPC Create Database Subnet Route Table (True/False)
variable "vpc_create_database_subnet_route_table" {
  description = "Whether to create a database subnet route table"
  type        = bool
  default     = true
}

# VPC Enable NAT Gateway (True/False)
variable "vpc_enable_nat_gateway" {
  description = "Whether to enable NAT Gateway"
  type        = bool
  default     = true
}

# VPC Single NAT Gateway (True/False)
variable "vpc_single_nat_gateway" {
  description = "Whether to create a single NAT Gateway"
  type        = bool
  default     = false
}

# EKS Cluster Input Variables
variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
  default     = "eksdemo"
}

# Input Variables
variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"

}

variable "environment" {
  description = "The environment for the resources (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

variable "business_division" {
  description = "The business division for the resources (e.g., sales, marketing)"
  type        = string
  default     = "SAP"
}

# AWS EC2 Instance Terraform Variables
variable "instance_type" {
  description = "The type of EC2 instance to use"
  type        = string
  default     = "t3.micro"
}

variable "instance_keypair" {
  description = "The key pair name to use for the EC2 instance"
  type        = string
  default     = "terraform-key"

}

variable "cluster_service_ipv4_cidr" {
  description = "service ipv4 cidr for the kubernetes cluster"
  type        = string
  default     = null
}

variable "cluster_version" {
  description = "Kubernetes minor version to use for the EKS cluster (for example 1.21)"
  type = string
  default     = null
}
variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled. When it's set to `false` ensure to have a proper private access with `cluster_endpoint_private_access = true`."
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# Optional: allow NodePort traffic (30000-32767) to a specific security group
variable "enable_nodeport_ingress" {
  description = "Whether to create a security group rule allowing Kubernetes NodePorts from the Internet."
  type        = bool
  default     = false
}

variable "nodeport_target_sg_id" {
  description = "Security group ID to which the NodePort ingress rule will be attached (typically the worker node or cluster primary security group)."
  type        = string
  default     = null
}