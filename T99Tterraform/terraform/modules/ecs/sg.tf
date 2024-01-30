# security group creation and attcahing in ecs, alb etc

################################
##### for ticket99/api #########
################################

# ALB Security Group: Edit to restrict access to the application
resource "aws_security_group" "alb_sg_api" {
  name        = "load-balancer-security-group-${var.APP_NAME}-${var.ENVIRONMENT}-api]"
  description = "controls access to the ALB"
  vpc_id      = var.VPC_ID

  ingress {
    protocol    = "tcp"
    from_port   = var.APP_PORT_API
    to_port     = var.APP_PORT_API
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# this security group for ecs - Traffic to the ECS cluster should only come from the ALB
resource "aws_security_group" "ecs_sg_api" {
  name        = "ecs-tasks-security-group-${var.APP_NAME}-${var.ENVIRONMENT}-api"
  description = "allow inbound access from the ALB only"
  vpc_id      = var.VPC_ID

  ingress {
    protocol        = "tcp"
    from_port       = var.APP_PORT_API
    to_port         = var.APP_PORT_API
    security_groups = [aws_security_group.alb_sg_api.id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

################################
##### for ticket99/admin-api ###
################################

# ALB Security Group: Edit to restrict access to the application
resource "aws_security_group" "alb_sg_admin_api" {
  name        = "load-balancer-security-group-${var.APP_NAME}-${var.ENVIRONMENT}-admin-api"
  description = "controls access to the ALB"
  vpc_id      = var.VPC_ID

  ingress {
    protocol    = "tcp"
    from_port   = var.APP_PORT_ADMIN_API
    to_port     = var.APP_PORT_ADMIN_API
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# this security group for ecs - Traffic to the ECS cluster should only come from the ALB
resource "aws_security_group" "ecs_sg_admin_api" {
  name        = "ecs-tasks-security-group-${var.APP_NAME}-${var.ENVIRONMENT}-admin-api"
  description = "allow inbound access from the ALB only"
  vpc_id      = var.VPC_ID

  ingress {
    protocol        = "tcp"
    from_port       = var.APP_PORT_ADMIN_API
    to_port         = var.APP_PORT_ADMIN_API
    security_groups = [aws_security_group.alb_sg_admin_api.id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
