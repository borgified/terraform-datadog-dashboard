# terraform module for autogenerating dashboards based on prefixed metrics

The Terraform Datadog provider does not offer a way to autodiscover metrics, however,
Datadog API can do this via [GET /v1/metrics](https://docs.datadoghq.com/api/?lang=python#get-list-of-active-metrics)

This terraform module uses an external data source [list_metrics.py](../blob/master/list_metrics.py) to fetch a list of
all available metrics filtered by a prefix so that this subset of metrics can be used as input to the [datadog_dashboard](https://www.terraform.io/docs/providers/datadog/r/dashboard.html)
resource.

For example, if you have these metrics in Datadog:
```
app.dev.memstats.alloc
app.dev.memstats.frees
app.dev.memstats.heap_released
...
```
then specify prefx = "app.dev.memstats" as your input.