# changelog
v0.1.15
- Allow user to specify a list of metrics to graph rather than querying them from datadog.
  If you specify `metrics_list` directly, then it will use this list of metrics to generate
  the dashboard instead of using the specified prefix to query it from datadog.
v0.1.14
- sort widgets
  produce output that is ordered in a consistent manner to avoid idempotency issues
v0.1.13
- fix validation warnings
  Warning: Interpolation-only expressions are deprecated
  Warning: Quoted type constraints are deprecated
v0.1.12
- Introduced optional var.title for dashboard so it wouldn't have to be tied to var.prefix
- Parametrized `space_aggregation` and `scope` which are part of the query that defines
  a particular timeseries graph. Previously `space_aggregation` was hardcoded to `avg`,
  now you can choose from `avg, max, min, sum`

v0.1.11
- Fixed example

v0.1.10
- Moved logic to download jq, if needed, into `list_metrics.py` where it belongs

v0.1.8
- Added resource to download jq since terraform cloud does not have it
- Modified `list_metrics.py` to use locally "installed" jq

v0.1.7
- Minor fix

v0.1.6
- Refactored `list_metrics.py` to remove dependency on python3 and datadog python module
