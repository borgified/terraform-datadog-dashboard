data "external" "list_metrics" {
  program = ["bash", "${path.module}/list_metrics.sh"]
  query = {
    api_key = var.api_key
    app_key = var.app_key
    prefix  = var.prefix
  }
}
