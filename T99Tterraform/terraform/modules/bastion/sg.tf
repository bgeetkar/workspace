resource "aws_security_group" "bastion" {
  vpc_id = var.VPC_ID
  name = "${var.APP_NAME}-${var.ENVIRONMENT}-bastion-sg"
  description = "security group that allows ssh and egress traffic to the nodes"

  tags = merge(local.default_tags, tomap({"Name" = "${var.APP_NAME}-${var.ENVIRONMENT}-bastion-sg"}))

  lifecycle {
    create_before_destroy = true
  }

}

## INGRESS RULE #1
resource "aws_security_group_rule" "allow-bastion-ssh" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = aws_security_group.bastion.id
  cidr_blocks = ["0.0.0.0/0"]
}

# INGRESS RULE #2
#resource "aws_security_group_rule" "allow-rdp-ssh" {
#  type = "ingress"
#  from_port = 3389
#  to_port = 3389
#  protocol = "tcp"
#  security_group_id = aws_security_group.bastion.id
#  cidr_blocks = ["0.0.0.0/0"]
#}

## EGRESS RULE #1
resource "aws_security_group_rule" "allow-bastion-s3-access" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "tcp"
  security_group_id = aws_security_group.bastion.id
  cidr_blocks = ["0.0.0.0/0"]
}
