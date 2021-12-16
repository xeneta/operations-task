
resource "aws_lb" "task-elb" {
  name               = "task-elb"
  load_balancer_type = "application"
  subnets            = [aws_subnet.publicOne.id, aws_subnet.publicTwo.id]
  security_groups    = ["${aws_security_group.lb-sg.id}"]
}

resource "aws_lb_listener" "http_forward" {
  load_balancer_arn = aws_lb.task-elb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-task.arn
  }
}

resource "aws_lb_target_group" "target-task" {
  name        = "target-task"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "90"
    protocol            = "HTTP"
    matcher             = "200-299"
    timeout             = "20"
    path                = "/"
    unhealthy_threshold = "2"
  }
}
