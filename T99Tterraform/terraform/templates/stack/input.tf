# instance variable
variable "AMI_ID" {
  type        = string
  default     = "ami-06192919097c34e5c"
  description = "This is AMI ID for EC2"
}
variable "SECURITY_GROUP_NAME" {
  type        = string
  default     = "staging-sg-group"
  description = "here is a security group"
}

variable "VPC_ID" {
  description = "The ID of the VPC where the Auto Scaling Group will be launched."
  default     = ""
}


variable "PUBLIC_SUBNET_ID" {
  description = "A list of subnet IDs where instances will be launched."
  default     = ""
}

variable "PRIVATE_SUBNET_ID" {
  description = "A list of subnet IDs where instances will be launched."
  default     = ""
}

variable "DESIRED_CAPACITY" {
  default     = 1
  description = "The desired number of instances in the Auto Scaling Group."
}

variable "MIN_SIZE" {
  default     = 1
  description = "The minimum size of the Auto Scaling Group."
}

variable "MAX_SIZE" {
  default     = 1
  description = "The maximum size of the Auto Scaling Group."
}

variable "INSTANCE_NAME" {
  type    = string
  default = "webui"
}

variable "INSTANCE_TYPE" {
  default     = "t3.micro"
  description = "The EC2 instance type for the Auto Scaling Group."
}
variable "KEY_NAME" {
  type    = string
  default = "dev-key"
}

variable "VOLUME_SIZE" {
  default     = "30"
  description = "The volume size of ebs."
}

variable "VOLUME_TYPE" {
  default     = "gp2"
  description = "The volume name of ebs."
}

############################################

#VPC variable
variable "CIDR_BLOCK" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "INSTANCE_TENANCY" {
  description = "A tenancy option for instances launched into the VPC"
  default     = "default"
}

variable "ENABLE_DNS_HOSTNAMES" {
  description = "Should be true to enable DNS hostnames in the VPC"
  default     = true
}

variable "ENABLE_DNS_SUPPORT" {
  description = "Should be true to enable DNS support in the VPC"
  default     = true
}

variable "PUBLIC_SUBNET_CIDR_BLOCK" {
  description = "The CIDR block for the Subnet"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]

}

variable "PRIVATE_SUBNET_CIDR_BLOCK" {
  description = "The CIDR block for the Subnet"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "VPC_NAME" {
  description = "Name of the VPC"
  default     = "vpc"
}

variable "PUBLIC_SUBNET_NAME" {
  description = "Name of the public subnet"
  default     = "public-subnet"
}

variable "INTERNET_GATEWAY_NAME" {
  description = "Name of the internet gateway"
  default     = "ig"
}

variable "ROUTE_TABLE_NAME" {
  description = "Name of the Route table"
  default     = "route-tables"
}

variable "PRIVATE_SUBNET_NAME" {
  type    = string
  default = "private-subnet"
}

variable "NAT_GATEWAY_NAME" {
  description = "Name of the Nat gateway"
  default     = "ngw"
}

variable "AWS_REGION" {
  type        = string
  default     = "ap-south-2"
  description = "aws region"
}

##########################################
# ECR VARIABLE

variable "ECR_NAME" {
  default = "ticket99/ticket99-api"
}

variable "ADDITIONAL_TAGS" {
  type    = map(any)
  default = {}
}
##########################################
# ECS VARIABLE

variable APP_NAME {
  type        = string
  default     = "ticket99"
}

variable ENVIRONMENT {
  type        = string
  default     = "staging"
}

variable "IMAGE_TAG_API" {
  default = "t99-api"
}

variable "IMAGE_TAG_ADMIN_API" {
  default = "t99-api"
}

variable "APP_IMAGE_ADMIN_API" {
  default     = "597612336131.dkr.ecr.ap-south-2.amazonaws.com/ticket99-admin/ticket99-admin-api"
  description = "docker image to run in this ECS cluster"
}

variable "APP_IMAGE_API" {
  default     = "597612336131.dkr.ecr.ap-south-2.amazonaws.com/ticket99/ticket99-api"
  description = "docker image to run in this ECS cluster"
}

########################################
// ELASTICCACHE Instance Variables

variable "ENABLE_REDIS" {
  type    = bool
  default = true
}

variable "STACK_REGION" {
  default = "ap-south-2"
}

variable "ENGINE_VERSION" {
  default = "7.1"
}

variable "REDIS_PORT" {
  default = "6379"
}

variable "ELASTICACHE_INSTANCE_TYPE" {
  default = "cache.t3.micro"
}

variable "NR_CACHE_NODES" {
  default = 2
}

variable "PARAMETER_GROUP_NAME" {
  default = "custom-redis-param-group"
}

variable "MAINTENANCE_WINDOW" {
  # SUN 01:00AM-02:00AM ET
  default = "sun:05:00-sun:06:00"
}

variable "ELASTICACHE_BACKUP_RENTENTION" {
  default = 30
}

variable "ELASTICACHE_AVAILABILITY_ZONES" {
  description = "Availability zone to use by Elasticache replica"
  default     = ""
}

variable "USE_REDIS_TRANSIT_ENCRYPTION" {
  default = false
}

variable "USE_REDIS_AT_REST_ENCRYPTION" {
  default = false
}

variable "ELASTICACHE_SG_INBOUND_DESCRIPTION" {
  type    = map(any)
  default = {}
}

variable "REDIS_FAMILY" {
  default = "redis7"
}

####### bastion variable ########

variable "BASTION_ROOT_DEVICE_SIZE" {
  default = 100
}

variable "BASTION_VOLUME_TYPE" {
  default = "gp2"
}

variable "BASTION_INSTANCE_TYPE" {
  default = "t3.medium"
}

# Stack will use followiing AZ for launch EC2 Instance,Elasticace and EFS
variable "AVAILABILITY_ZONES_TO_USE" {
  description = "Availability zone to use"
  type        = map(any)
  default     = {}
}

variable "BASTION_AMI" {
  default = "ami-06192919097c34e5c"
}

variable "BASTION_NAME" {
  description = "Name of bastion machine, e.g. bastion-us-east-1-dev-demo"
  default     = "dev-bastion"
}

variable "BASTION_SG_OUTBOUND_DESCRIPTION" {
  type    = map(any)
  default = {}
}

variable "BASTION_SG_INBOUND_DESCRIPTION" {
  type    = map(any)
  default = {}
}

variable "USE_TEMPLATE" {
  default = true
}
