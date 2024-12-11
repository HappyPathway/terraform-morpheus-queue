output "security_group" {
  value = aws_security_group.mq
}

output "broker" {
  value = aws_mq_broker.mq
}
