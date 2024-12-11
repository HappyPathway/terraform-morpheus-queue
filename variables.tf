# Missing Vraiables:  [
#     "username",
#     "create_mq",
#     "vpc_id",
#     "brokers",
#     "use_aws_owned_key",
#     "name",
#     "kms_key_id",
#     "mq_security_group",
#     "mq_configuration",
#     "security_group_ids"
# ]
variable "username" {
  description = "The username for the MQ broker"
  type        = string
}

variable "create_mq" {
  description = "Flag to create MQ broker"
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "The VPC ID where the MQ broker will be deployed"
  type        = string
}

variable "brokers" {
  description = "List of brokers"
  type        = list(string)
}

variable "use_aws_owned_key" {
  description = "Flag to use AWS owned key for encryption"
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the MQ broker"
  type        = string
}

variable "kms_key_id" {
  description = "The KMS key ID for encryption"
  type        = string
}

variable "mq_security_group" {
  description = "The security group for the MQ broker"
  type        = string
}

variable "mq_configuration" {
  description = "The configuration for the MQ broker"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "user" {
  description = "The user for the MQ broker"
  type = object({
    username       = string
    db_credentials = string
  })
}

variable "subnet_name_filter" {
  description = "The filter for subnet names"
  type        = string
}
