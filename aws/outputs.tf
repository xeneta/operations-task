output "loadbalancer_dns" {
    value = aws_lb.task-elb.dns_name
}

output "db_host" {
  value = aws_db_instance.db.address
}

output "rds_master_password" {
    value = nonsensitive(random_password.master_password.result)
}

output "account_id" {
  value = local.account_id
}
