resource "google_monitoring_alert_policy" "cpu_high_policy" {
  display_name = "High CPU Utilization"
  combiner     = "OR"
  conditions {
    display_name = "Cloud Run Revision - CPU Utilization"
    condition_threshold {
      filter     = "resource.type = \"cloud_run_revision\" AND metric.type = \"run.googleapis.com/container/cpu/utilizations\""
      duration   = "300s"
      comparison = "COMPARISON_GT"
      threshold_value = 0.7
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  notification_channels = [] # Add Notification Channel ID here
}
