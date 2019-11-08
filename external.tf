resource "null_resource" "get_jq" {
  provisioner "local-exec" {
    command = "curl -sL https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -o jq && chmod u+x jq"
  }
}

data "external" "list_metrics" {
  depends_on = [ null_resource.get_jq ]
  program = ["bash", "${path.module}/list_metrics.sh"]
  query = {
    api_key = var.api_key
    app_key = var.app_key
    prefix  = var.prefix
  }
}
