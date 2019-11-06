data "external" "list_metrics" {
  program = ["python3", "${path.module}/list_metrics.py"]

  query = {
    api_key = var.secrets.api_key,
    app_key = var.secrets.app_key,
    prefix  = var.prefix
  }
}
