resource "aws_lb" "loadbalancer_app" {
  name               = "loadbalancer-app"
  internal           = false
  load_balancer_type = "application"

  subnets         = [aws_subnet.main1.id, aws_subnet.main2.id, aws_subnet.main3.id]
  security_groups = [aws_security_group.loadbalncer_security.id]
}
# resource "aws_lb_listener" "http" {
#   load_balancer_arn = aws_lb.loadbalancer_app.arn
#   port              = "80"
#   protocol          = "HTTP"
#   default_action {
#     type = "forward"
#     forward {
#       target_group {
#         arn = aws_lb_target_group.loadbalancer_target_group.arn
#       }
#       stickiness {
#         enabled  = true
#         duration = 28800
#       }
#     }
#   }
# }

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.loadbalancer_app.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn = data.aws_acm_certificate.certificate_new.arn
  default_action {
    type = "forward"
    forward {
      target_group {
        arn = aws_lb_target_group.loadbalancer_target_group.arn
      }
      stickiness {
        enabled  = true
        duration = 28800
      }
    }
  }
}