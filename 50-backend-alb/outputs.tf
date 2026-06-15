output "backend_alb_listener_arn" {
  value = aws_lb_listener.backend_alb.arn
}

output "backend_alb_arn" {
  value = aws_lb.backend-alb.arn
}

output "backend_alb_dns_name" {
  value = aws_lb.backend-alb.dns_name
}