locals {
  default_tags = {
    managed_by = "terraform"
    //Name = "${var.APP_NAME}-${var.ENVIRONMENT}-bastion"
    stack-identifier = var.APP_NAME
    staging = var.ENVIRONMENT
  }
}

data "template_file" "bastion" {
  template = file("${path.module}/userdata.ps1")
  vars = {
    SERVICE = "bastion"
    STACK_REGION = var.STACK_REGION
  }
}

data "template_cloudinit_config" "bastion" {
  gzip = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content = data.template_file.bastion.rendered
  }
}

resource "aws_eip" "bastion_eip" {
  instance = aws_instance.bastion.id
  domain = "vpc"
}

resource "aws_instance" "bastion" {
  ami                    = var.BASTION_AMI
  instance_type          = var.BASTION_INSTANCE_TYPE
  key_name               = var.KEY_NAME
  subnet_id              = var.PUBLIC_SUBNET_ID
  user_data              = var.USE_TEMPLATE ? data.template_cloudinit_config.bastion.rendered : var.USE_TEMPLATE

  root_block_device {
    encrypted = true
    tags = local.default_tags
    volume_size = var.BASTION_ROOT_DEVICE_SIZE
    volume_type = var.BASTION_VOLUME_TYPE
  }

  vpc_security_group_ids = [aws_security_group.bastion.id]
  tags = merge(local.default_tags, tomap({"Name" = "${var.APP_NAME}-${var.ENVIRONMENT}-bastion"}))
}

