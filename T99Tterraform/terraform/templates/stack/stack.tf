#module "instance" {
#  source                 = "../../modules/instance"
#  AMI_ID                 = var.AMI_ID
#  INSTANCE_TYPE          = var.INSTANCE_TYPE
#  SECURITY_GROUP_NAME    = var.SECURITY_GROUP_NAME
#  VPC_ID                 = module.vpc_base.vpc_id
#  APP_NAME             = var.APP_NAME
#  ENVIRONMENT = var.ENVIRONMENT
#  KEY_NAME               = var.KEY_NAME
#  PRIVATE_SUBNET_ID      = module.vpc_base.private_subnet_ids
#  PUBLIC_SUBNET_ID       = module.vpc_base.public_subnets_id
#}