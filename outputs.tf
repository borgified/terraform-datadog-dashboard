output "url" {
  description = "visit this url to go to your new dashboard"
  value       = "https://app.datadoghq.com/dashboard/${datadog_dashboard.dashboard.id}"
}
