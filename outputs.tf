output "url" {
  description = "visit this url to go to your new dashboard"
  value       = var.metrics_list == "" ? "https://app.datadoghq.com/dashboard/${datadog_dashboard.dashboard_a[0].id}" : "https://app.datadoghq.com/dashboard/${datadog_dashboard.dashboard_b[0].id}"
}

output "external_metrics" {
  description = "queryable metrics from datadog discovered"
  value       = data.external.list_metrics.result.metrics
}
