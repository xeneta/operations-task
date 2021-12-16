resource "aws_ecs_service" "app" {
  name             = "app"
  cluster          = aws_ecs_cluster.dev-cluster.name
  task_definition  = aws_ecs_task_definition.app.arn
  desired_count    = 1
  launch_type      = "FARGATE"
  platform_version = "1.3.0"

  network_configuration {
    subnets          = [aws_subnet.publicOne.id, aws_subnet.publicTwo.id]
    security_groups  = [aws_security_group.ecs-task-sg.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.target-task.arn
    container_name   = "api"
    container_port   = 3000
  }

  depends_on = [aws_lb_listener.http_forward, aws_iam_role_policy_attachment.ecs_task_execution_role]
}
