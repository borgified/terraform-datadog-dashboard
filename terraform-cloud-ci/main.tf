resource "null_resource" "get_jq" {
  provisioner "local-exec" {
    command = "curl -sL https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -o jq && chmod u+x jq"
  }
  triggers = {
    redownload_every_apply = "${timestamp()}"
  }
}

module "dashboard" {
  source  = "../"
  prefix      = "app.dev.memstats"
  api_key     = "your datadog api key"
  app_key     = "your datadog app key"
  dependency  = [ null_resource.get_jq ]
}
