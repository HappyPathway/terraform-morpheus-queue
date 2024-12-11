# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.



# __generated__ by Terraform
resource "aws_mq_broker" "mq" {
  for_each                            = toset(var.brokers)
  apply_immediately                   = null
  authentication_strategy             = "simple"
  auto_minor_version_upgrade          = true
  broker_name                         = each.value
  data_replication_mode               = null
  data_replication_primary_broker_arn = null
  deployment_mode                     = "CLUSTER_MULTI_AZ"
  engine_type                         = "RabbitMQ"
  engine_version                      = "3.12.13"
  host_instance_type                  = "mq.m5.xlarge"
  publicly_accessible                 = false
  security_groups = var.mq_security_group == null ? concat(
    var.security_group_ids,
    [
      one(aws_security_group.mq).id
    ]
  ) : [var.mq_security_group]

  storage_type = "ebs"
  subnet_ids   = data.aws_subnets.db_subnets.ids
  user {
    username = var.user.username
    password = var.user.db_credentials
  }
  tags = {
    costAllocation = "MorpheusDev"
  }
  tags_all = {
    costAllocation = "MorpheusDev"
  }

  dynamic "configuration" {
    for_each = var.mq_configuration == null ? [] : ["*"]
    content {
      id       = var.mq_configuration.id
      revision = var.mq_configuration.revision
    }
  }

  encryption_options {
    kms_key_id        = var.use_aws_owned_key == true ? null : var.kms_key_id
    use_aws_owned_key = var.use_aws_owned_key
  }
  logs {
    audit   = null
    general = true
  }
  maintenance_window_start_time {
    day_of_week = "MONDAY"
    time_of_day = "08:00"
    time_zone   = "UTC"
  }
  lifecycle {
    ignore_changes = [
      security_groups,
      encryption_options,
      user,
      tags,
      tags_all,
      configuration,
      maintenance_window_start_time,
      apply_immediately
    ]
  }
}
