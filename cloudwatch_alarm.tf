resource "aws_cloudwatch_metric_alarm" "high_alarm_cpu" {
  alarm_name          = "high_alarm_cpu"
  alarm_description   = "Scale-up if CPU > 5% for 60 seconds"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  statistic           = "Average"
  period              = 60
  evaluation_periods  = 2
  threshold           = var.threshold_up
  comparison_operator = "GreaterThanThreshold"
  alarm_actions       = [aws_autoscaling_policy.asg_scale_up.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.autoS-group.name
  }
}

# cloudwatch scale down metric
resource "aws_cloudwatch_metric_alarm" "low_alarm_cpu" {
  alarm_name          = "low_alarm_cpu"
  alarm_description   = "Scale-down if CPU < 3% for 60 seconds"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  statistic           = "Average"
  period              = 60
  evaluation_periods  = 2
  threshold           = var.threshold_down
  comparison_operator = "LessThanThreshold"
  alarm_actions       = [aws_autoscaling_policy.asg_scale_down.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.autoS-group.name
  }
}