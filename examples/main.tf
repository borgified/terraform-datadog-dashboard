module "datadog_dashboard" {
  source = "../"
  prefix = "app.dev.memstats"
  secrets = {
    api_key = "your_api_key",
    app_key = "your_app_key"
  }
}
