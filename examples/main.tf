module "dashboard" {
  source  = "borgified/dashboard/datadog"
  version = "0.1.4"
  prefix      = "app.dev.memstats"
  api_key     = "your datadog api key"
  app_key     = "your datadog app key"
}
