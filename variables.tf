variable "api_key" {
  description = "datadog api key"
  type        = "string"
}

variable "app_key" {
  description = "datadog app key"
  type        = "string"
}

variable "prefix" {
  description = "metric prefix to pattern match against available metrics in datadog also used for dashboard title"
  type        = "string"
}

variable "description" {
  description = "datadog dashboard description"
  type        = "string"
}
