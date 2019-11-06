provider "datadog" {
  version = "~> 2.5"
  api_key = "${var.secrets.api_key}"
  app_key = "${var.secrets.app_key}"
}

provider "external" {
  version = "~> 1.2"
}
