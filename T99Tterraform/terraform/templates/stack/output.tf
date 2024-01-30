output "vpc_id" {
  value = module.vpc_base.vpc_id
}

output "public_subnets_id" {
  value = module.vpc_base.public_subnets_id
}

output "private_subnet_ids" {
  value = module.vpc_base.private_subnet_ids
}

#output "ecr_repository_url" {
#  value = module.ecr.ecr_repository_url
#}


#output "secgroup_id" {
#  value = module.instance.secgroup_id
#}

#output "t99_aws_alb_target_group_arn" {
#  value = module.instance.aws_alb_target_group_arn
#}

output "alb_hostname_admin_api" {
  value = module.ecs.alb_hostname_admin_api
}

output "alb_hostname_api" {
  value = module.ecs.alb_hostname_api
}

output "hostname" {
  value = module.redis_cluster.hostname
}

output "redis_hostname" {
  value = module.redis_cluster.hostname
}

output "nuxeo_elasticache_sg_id" {
  value = module.redis_cluster.nuxeo_elasticache_sg_id
}

output "redis_cluster_id" {
  value = module.redis_cluster.redis_cluster_id
}
