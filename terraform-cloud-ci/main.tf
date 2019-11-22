module "dashboard" {
  source  = "../"
  prefix      = var.prefix
  api_key     = var.api_key
  app_key     = var.app_key
  space_aggregation = var.space_aggregation
  scope = var.scope
}
