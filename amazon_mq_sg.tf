# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sg-0abc71092173a221d"
resource "aws_security_group" "mq" {
  description            = "Rabbit MQ and Elastic Search via AWS for Morpheus"
  name                   = "${var.name}-rabbitmq"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags = {
    Name = "${var.name}-rabbitmq"
  }
  tags_all = {
    Name = "${var.name}-rabbitmq"
  }
  vpc_id = var.vpc_id
  lifecycle {
    ignore_changes = [
      description,
      tags,
      tags_all,
      revoke_rules_on_delete
    ]
  }
}

resource "aws_security_group_rule" "mq_ingress_http_api" {
  type              = "ingress"
  from_port         = 15671
  to_port           = 15672
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "HTTP API clients, management UI and rabbitmqadmin, without and with TLS (only if the management plugin is enabled)"
  security_group_id = aws_security_group.mq.id
}

resource "aws_security_group_rule" "mq_ingress_console" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "RabbitMQ Console"
  security_group_id = aws_security_group.mq.id
}

resource "aws_security_group_rule" "mq_ingress_rabbitmq" {
  type              = "ingress"
  from_port         = 5671
  to_port           = 5672
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "RabbitMQ"
  security_group_id = aws_security_group.mq.id
}

resource "aws_security_group_rule" "mq_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.mq.id
}
