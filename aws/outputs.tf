output "loadbalancer_dns" {
    value = aws_lb.task-elb.dns_name
}

output "db_host" {
  value = aws_db_instance.db.address
}

output "rdsMasterPassword" {
    value = nonsensitive(random_password.master_password.result)
}
