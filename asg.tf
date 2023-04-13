resource "aws_autoscaling_group" "autoS-group" {

  desired_capacity = var.desired_capacity

  max_size = var.max_sizeasg

  min_size = var.min_sizeasg

  name = "LaunchTemplated_created_by_Terraform"

  #   launch_configuration = aws_launch_configuration.autoScaling_launch_config.name

  launch_template {
    id = aws_launch_template.template_launch.id
    version = "$Latest"
  }
  default_cooldown = var.cooldown

  force_delete = true

  target_group_arns = [aws_lb_target_group.loadbalancer_target_group.arn]

  vpc_zone_identifier = [
    aws_subnet.main1.id,
    aws_subnet.main2.id,
    aws_subnet.main3.id
  ]

  #   load_balancers = [
  #     aws_lb.load_balancer.id
  #   ]

  tag {
    key                 = "Name"
    value               = "webapp"
    propagate_at_launch = true
  }
}

# resource "aws_autoscaling_policy" "asg_policy" {

#   name = "asg_policy"

#   policy_type = "TargetTrackingScaling"

#   autoscaling_group_name = aws_autoscaling_group.autoS-group.name

#   adjustment_type = "ChangeInCapacity"

#   target_tracking_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "ASGAverageCPUUtilization"
#     }
#     target_value = var.target_value
#   }


# }

resource "aws_autoscaling_policy" "asg_scale_up" {
  name                   = "autoscaling_scale_up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 30
  policy_type            = "SimpleScaling"
  autoscaling_group_name = aws_autoscaling_group.autoS-group.name
}


resource "aws_autoscaling_policy" "asg_scale_down" {
  name                   = "autoscaling_scale_down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 30
  policy_type            = "SimpleScaling"
  autoscaling_group_name = aws_autoscaling_group.autoS-group.name
}
resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.autoS-group.id
  lb_target_group_arn    = aws_lb_target_group.loadbalancer_target_group.arn
}