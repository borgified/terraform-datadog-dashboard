provider "datadog" {
  version = "~> 2.5"
  api_key = var.api_key
  app_key = var.app_key
}

provider "external" {
  version = "~> 1.2"
}
