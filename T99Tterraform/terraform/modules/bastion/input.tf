variable "INSTANCE_TYPE" {
  default     = "t3.medium"
  description = "Instance type, see a list at: https://aws.amazon.com/ec2/instance-types/"
}

variable "STACK_REGION" {
  description = "AWS Region, e.g us-west-2"
}

variable "BASTION_ROOT_DEVICE_SIZE" {
  default = 100
}

variable "BASTION_VOLUME_TYPE" {
  default = "gp2"
}

variable "BASTION_INSTANCE_TYPE" {
  default = "t3.medium"
}

variable "VPC_ID" {
  description = "VPC ID"
}

# Stack will use followiing AZ for launch EC2 Instance,Elasticace and EFS
variable "AVAILABILITY_ZONES_TO_USE" {
  description = "Availability zone to use"
  type        = map
  default     = {}
}

variable "APP_NAME" {
  description = "Name of the stack to be installed (ncoint-xyz)"
}

variable "ENVIRONMENT" {
  description = "Name of the stack to be installed (xyz-sandbox,preprod2)"
}

variable "BASTION_AMI" {
  default = "ami-06192919097c34e5c"
}

variable "BASTION_NAME" {
  description = "Name of bastion machine, e.g. bastion-us-east-1-dev-demo"
}

variable "BASTION_SG_OUTBOUND_DESCRIPTION" {
  type= map
  default = {}
}

variable "BASTION_SG_INBOUND_DESCRIPTION" {
  type = map
  default = {}
}

variable "USE_TEMPLATE" {
  default = true
}

variable "PUBLIC_SUBNET_ID" {
  description = "A list of subnet IDs where instances will be launched."
}

variable "PRIVATE_SUBNET_ID" {
  description = "A list of subnet IDs where instances will be launched."
}

variable KEY_NAME {
  type        = string
  default     = ""
}

variable "NETWORK_INTERFACE_ID" {
  default = ""
}

variable "SECGROUP_NUXEO" {
  default = ""
}
