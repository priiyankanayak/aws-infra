resource "aws_lb_target_group" "loadbalancer_target_group" {
  name        = "loadbalancer-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "instance"

  health_check {
    path = "/healthz"
    enabled = true
    port = 80
    interval = 300
    protocol = "HTTP"

  }


}