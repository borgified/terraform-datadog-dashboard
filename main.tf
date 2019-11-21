resource "datadog_dashboard" "dashboard" {
  title       = var.title
  description = var.description
  layout_type = "ordered"

  dynamic "widget" {
    for_each = split(",", data.external.list_metrics.result.metrics)
    content {
      timeseries_definition {
        title = "${widget.value}"
        request {
          q = "${var.space_aggregation}:${var.prefix}.${widget.value}{${var.scope}}"
          metadata {
            expression = "${var.space_aggregation}:${var.prefix}.${widget.value}{${var.scope}}"
            alias_name = "${widget.value}"
          }
        }
      }
    }
  }
}
