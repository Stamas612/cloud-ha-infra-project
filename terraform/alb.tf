resource "aws_lb_target_group" "web" {
  name     = "cloud-ha-infra-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "cloud-ha-infra-tg"
  }
}

resource "aws_lb_target_group_attachment" "web_a" {
  target_group_arn = aws_lb_target_group.web.arn
  target_id        = aws_instance.web.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "web_b" {
  target_group_arn = aws_lb_target_group.web.arn
  target_id        = aws_instance.web-b.id
  port             = 80
}

resource "aws_lb" "web" {
  name               = "cloud-ha-infra-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = [aws_subnet.public.id, aws_subnet.public_b.id]

  tags = {
    Name = "cloud-ha-infra-alb"
  }
}

resource "aws_lb_listener" "web" {
  load_balancer_arn = aws_lb.web.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }
}
