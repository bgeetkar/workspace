#in this template we are creating aws application laadbalancer and target group and alb http listener
##########################
## for ticket99/api ######
##########################

resource "aws_alb" "t99_ecs_alb_api" {
  name           = "alb-${var.APP_NAME}-${var.ENVIRONMENT}-api"
  subnets        = var.PUBLIC_SUBNET_ID
  security_groups = [aws_security_group.alb_sg_api.id]
}

resource "aws_alb_target_group" "t99_ecs_tg_api" {
  name        = "tg-${var.APP_NAME}-${var.ENVIRONMENT}-api"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.VPC_ID

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    protocol            = "HTTP"
    matcher             = "200"
    path                = var.HEALTH_CHECK_PATH
    interval            = 30
  }
}

#redirecting all incomming traffic from ALB to the target group
resource "aws_alb_listener" "t99_ecs_alb_listener_api" {
  load_balancer_arn = aws_alb.t99_ecs_alb_api.id
  port              = var.APP_PORT_API
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  #enable above 2 if you are using HTTPS listner and change protocal from HTTPS to HTTPS
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.t99_ecs_tg_api.arn
  }
}

################################
##### for ticket99/admin-api ###
################################

resource "aws_alb" "t99_ecs_alb_admin_api" {
  name           =  "alb-${var.APP_NAME}-${var.ENVIRONMENT}-admin-api"
  subnets        = var.PUBLIC_SUBNET_ID
  security_groups = [aws_security_group.alb_sg_admin_api.id]
}

resource "aws_alb_target_group" "t99_ecs_tg_admin_api" {
  name        =  "tg-${var.APP_NAME}-${var.ENVIRONMENT}-admin-api"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.VPC_ID
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    protocol            = "HTTP"
    matcher             = "200"
    path                = var.HEALTH_CHECK_PATH
    interval            = 30
  }
}

#redirecting all incomming traffic from ALB to the target group
resource "aws_alb_listener" "t99_ecs_alb_listener_admin_api" {
  load_balancer_arn = aws_alb.t99_ecs_alb_admin_api.id
  port              = var.APP_PORT_ADMIN_API
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  #enable above 2 if you are using HTTPS listner and change protocal from HTTPS to HTTPS
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.t99_ecs_tg_admin_api.arn
  }
}