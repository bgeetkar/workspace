module "bastion" {
  source                 = "../../modules/bastion"
  BASTION_NAME           = var.BASTION_NAME
  BASTION_AMI            = var.BASTION_AMI
  INSTANCE_TYPE          = var.BASTION_INSTANCE_TYPE
  VPC_ID                 = module.vpc_base.vpc_id
  ENVIRONMENT            = var.ENVIRONMENT
  APP_NAME               = var.APP_NAME
  KEY_NAME               = var.KEY_NAME
  PRIVATE_SUBNET_ID      = module.vpc_base.private_subnet_ids
  PUBLIC_SUBNET_ID       = module.vpc_base.public_subnets_id[0]
  STACK_REGION           = var.STACK_REGION
}