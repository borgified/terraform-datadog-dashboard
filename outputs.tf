output "datadog_dashboard_url" {
  value = "https://app.datadoghq.com/dash/${datadog_dashboard.dashboard.id}"
}
