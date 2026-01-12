resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "high-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "300"
  statistic           = "Average"
  threshold           = "70"
  alarm_description   = "This metric monitors ec2 cpu utilization"
  alarm_actions       = [] # Add SNS topic ARN here

  dimensions = {
    ClusterName = aws_ecs_cluster.main.name
  }
}
