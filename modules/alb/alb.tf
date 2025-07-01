terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0"
    }
  }
}

variable "name" {
  description = "Name of the project"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the ALB will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "List of subnet IDs where the ALB will be deployed"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to attach to the ALB"
  type        = list(string)
}

variable "target_instance_ids" {
  description = "List of target instance (EC2) IDs to attach to the ALB"
  type        = list(string)
}

resource "aws_lb" "this" {
  name               = "${var.name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.subnet_id
}

resource "aws_lb_listener" "listener80" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg80.arn
  }
}

resource "aws_lb_target_group" "tg80" {
  name     = "${var.name}-tg80"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group_attachment" "attach80" {
  count = length(var.target_instance_ids)

  target_group_arn = aws_lb_target_group.tg80.arn
  target_id        = var.target_instance_ids[count.index]
  port             = 80
}

output "url" {
  value = "http://${aws_lb.this.dns_name}"
}
