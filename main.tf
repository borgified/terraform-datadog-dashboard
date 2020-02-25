locals {
  scope = format("%s,$%s", var.scope, var.template_variable_name)
}

resource "datadog_dashboard" "dashboard_a" {

  count = var.metrics_list == "" ? 1 : 0

  title       = var.title
  description = var.description
  layout_type = "ordered"

  dynamic "widget" {
    for_each = sort(split(",", data.external.list_metrics.result.metrics))
    content {
      timeseries_definition {
        title = widget.value
        request {
          q = "${var.space_aggregation}:${var.prefix}.${widget.value}{${local.scope}}"
          metadata {
            expression = "${var.space_aggregation}:${var.prefix}.${widget.value}{${local.scope}}"
            alias_name = widget.value
          }
        }
      }
    }
  }
  template_variable {
    name    = var.template_variable_name
    prefix  = var.template_variable_prefix
    default = var.template_variable_default
  }
}

resource "datadog_dashboard" "dashboard_b" {

  count = var.metrics_list != "" ? 1 : 0

  title       = var.title
  description = var.description
  layout_type = "ordered"

  dynamic "widget" {
    for_each = sort(split(",", var.metrics_list))
    content {
      timeseries_definition {
        title = widget.value
        request {
          q = "${var.space_aggregation}:${var.prefix}.${widget.value}{${local.scope}}"
          metadata {
            expression = "${var.space_aggregation}:${var.prefix}.${widget.value}{${local.scope}}"
            alias_name = widget.value
          }
        }
      }
    }
  }
  template_variable {
    name    = var.template_variable_name
    prefix  = var.template_variable_prefix
    default = var.template_variable_default
  }
}
