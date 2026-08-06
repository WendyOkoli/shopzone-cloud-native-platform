#############################################
# Application Load Balancer
#############################################

resource "aws_lb" "shopzone" {
  name               = "${var.project_name}-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb.id
  ]

  subnets = aws_subnet.public[*].id

  enable_deletion_protection = false

  tags = {
    Name        = "${var.project_name}-alb"
    Environment = var.environment
    Project     = var.project_name
  }
}

#############################################
# Target Group
#############################################

resource "aws_lb_target_group" "shopzone" {
  name        = "${var.project_name}-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"

  vpc_id = aws_vpc.shopzone.id

  health_check {
    enabled             = true
    path                = "/health"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name        = "${var.project_name}-tg"
    Environment = var.environment
    Project     = var.project_name
  }
}

#############################################
# HTTP Listener
#############################################

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.shopzone.arn

  port     = 80
  protocol = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.shopzone.arn
  }
}