module "redis_cluster" {
  source                             = "../../modules/redis"
  ENABLE_REDIS                       = var.ENABLE_REDIS
  REDIS_FAMILY                       = var.REDIS_FAMILY
  PUBLIC_SUBNET_ID                   = module.vpc_base.public_subnets_id
  PRIVATE_SUBNET_ID                  = module.vpc_base.private_subnet_ids
  VPC_ID                             = module.vpc_base.vpc_id
  ELASTICACHE_SG_INBOUND_DESCRIPTION = var.ELASTICACHE_SG_INBOUND_DESCRIPTION
  USE_REDIS_AT_REST_ENCRYPTION       = var.USE_REDIS_AT_REST_ENCRYPTION
  USE_REDIS_TRANSIT_ENCRYPTION       = var.USE_REDIS_TRANSIT_ENCRYPTION
  ELASTICACHE_AVAILABILITY_ZONES     = var.ELASTICACHE_AVAILABILITY_ZONES
  ELASTICACHE_BACKUP_RENTENTION      = var.ELASTICACHE_BACKUP_RENTENTION
  MAINTENANCE_WINDOW                 = var.MAINTENANCE_WINDOW
  PARAMETER_GROUP_NAME               = var.PARAMETER_GROUP_NAME
  NR_CACHE_NODES                     = var.NR_CACHE_NODES
  ELASTICACHE_INSTANCE_TYPE          = var.ELASTICACHE_INSTANCE_TYPE
  REDIS_PORT                         = var.REDIS_PORT
  ENGINE_VERSION                     = var.ENGINE_VERSION
  ENVIRONMENT             = var.ENVIRONMENT
}