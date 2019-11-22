module "dashboard" {
  source  = "../"
  prefix      = var.prefix
  api_key     = var.api_key
  app_key     = var.app_key
  space_aggregation = "avg"
  scope = "*"
}
