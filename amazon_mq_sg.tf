# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sg-0abc71092173a221d"
resource "aws_security_group" "mq" {
  count       = var.create_mq ? 1 : 0
  description = "Rabbit MQ and Elastic Search via AWS for Morpheus"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = " HTTP API clients, management UI and rabbitmqadmin, without and with TLS (only if the management plugin is enabled)"
    from_port        = 15671
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 15672
    }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "RabbitMQ Console"
    from_port        = 443
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 443
    }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "RabbitMQ"
    from_port        = 5671
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 5672
  }]
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
