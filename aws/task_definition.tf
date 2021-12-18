resource "aws_ecs_task_definition" "app" {
  family                   = "app"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  container_definitions = jsonencode([
    {
      name      = "api"
      image     = "${var.TF_VAR_accountid}.dkr.ecr.eu-west-2.amazonaws.com/api:latest"
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ],
      "secrets" : [
        { "name" : "HOST", "valueFrom" : "arn:aws:ssm:eu-west-2:${var.TF_VAR_accountid}:parameter/HOST" },
        { "name" : "NAME", "valueFrom" : "arn:aws:ssm:eu-west-2:${var.TF_VAR_accountid}:parameter/NAME" },
        { "name" : "PASSWORD", "valueFrom" : "arn:aws:ssm:eu-west-2:${var.TF_VAR_accountid}:parameter/PASSWORD" },
      ],      
      "logConfiguration" : {
        "logDriver" : "awslogs",
        "options" : {
          "awslogs-group" : "api",
          "awslogs-region" : "eu-west-2",
          "awslogs-stream-prefix" : "ecs"
        }
      }
    }
  ])
}
resource "aws_cloudwatch_log_group" "api" {
  name = "api"
}
