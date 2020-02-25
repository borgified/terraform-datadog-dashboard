module "dashboard_a" {
  source  = "borgified/dashboard/datadog"
  version = "0.1.16"
  prefix      = "aws.applicationelb"
  api_key     = "your datadog api key"
  app_key     = "your datadog app key"
  space_aggregation = "sum"
  scope = "*"
}

module "dashboard_b" {
  source  = "borgified/dashboard/datadog"
  version = "0.1.16"
  prefix      = "aws.applicationelb"
  api_key     = "your datadog api key"
  app_key     = "your datadog app key"
  metrics_list = "active_connection_count,client_tlsnegotiation_error_count"
  space_aggregation = "sum"
  scope = "*"
}
