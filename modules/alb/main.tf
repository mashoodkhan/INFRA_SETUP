resource "aws_security_group" "alb_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "EA-alb-sg"
  }
}

resource "aws_lb" "this" {
  name = var.alb_name
  load_balancer_type = "application"
  subnets            = var.public_subnets
  security_groups    = [aws_security_group.alb_sg.id]
   tags = {
    Name = "EA-${var.alb_name}"
  }
}

resource "aws_lb_target_group" "this" {
  name = var.target_group_name
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
  path                = "/"
  port                = "8080"
  protocol            = "HTTP"
  healthy_threshold   = 2
  unhealthy_threshold = 2
  timeout             = 5
  interval            = 30
   }
   tags = {
    Name = "EA-${var.target_group_name}"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}