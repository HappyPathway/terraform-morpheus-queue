data "aws_subnets" "db_subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
  filter {
    name   = "tag:Name"
    values = [var.subnet_name_filter]
  }
}

