resource "aws_lb" "backend-alb" {
  name               = "${local.comman_name_suffix}-backend-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_sg_id]
  subnets            = local.private_subnet_id

  enable_deletion_protection = false


  tags = merge(
    local.common_tags,
    {
        Name = "${local.comman_name_suffix}-backend-alb"
    }
  )
}

# Backed ALB Listeners on port number 80
# resource "aws_lb_listener" "front_end" {
#   load_balancer_arn = aws_lb.backend-alb.arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     type = "fixed-response"

#     fixed_response {
#       content_type = "text/plain"
#       message_body = "Hi i am from bacckend ALB HTTP"
#       status_code  = "200"
#     }
#   }
# }

resource "aws_lb_listener" "backend_alb" {
  load_balancer_arn = aws_lb.backend-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Hi i am from bacckend ALB HTTP"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "backend-alb" {
  zone_id = var.zone_id
  name    = "*.backend-alb-${var.environment}.${var.domain_name}"
  type    = "A"

  alias {
    # This are ALB details not our details
    name                   = aws_lb.backend-alb.dns_name
    zone_id                = aws_lb.backend-alb.zone_id
    evaluate_target_health = true
  }
}