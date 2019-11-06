resource "datadog_dashboard" "dashboard" {
  title       = var.prefix
  description = var.description
  layout_type = "ordered"

  dynamic "widget" {
    for_each = split(",", data.external.list_metrics.result.metrics)
    content {
      timeseries_definition {
        title = "${widget.value}"
        request {
          q = "avg:${var.prefix}.${widget.value}{*}"
          metadata {
            expression = "avg:${var.prefix}.${widget.value}{*}"
            alias_name = "${widget.value}"
          }
        }
      }
    }
  }
}
