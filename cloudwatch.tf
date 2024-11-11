resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name                = "high_cpu_alarm"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "1"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors EC2 CPU utilization."
  insufficient_data_actions = []
  alarm_actions             = [aws_sns_topic.example.arn]
}
