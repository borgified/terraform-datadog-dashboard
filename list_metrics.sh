#!/usr/bin/env bash
# based on https://www.terraform.io/docs/providers/external/data_source.html#processing-json-in-shell-scripts

set -e

eval "$(jq -r '@sh "API_KEY=\(.api_key) APP_KEY=\(.app_key) PREFIX=\(.prefix)"')"

RESULT=$(curl -s -X GET \
-H "DD-API-KEY: ${API_KEY}" \
-H "DD-APPLICATION-KEY: ${APP_KEY}" \
-d "api_key=${API_KEY}" \
-d "application_key=${APP_KEY}" \
"https://api.datadoghq.com/api/v1/search?q=metrics:${PREFIX}" \
| jq -r --arg prefix "$PREFIX." '.results.metrics|sort|map(sub($prefix;""))|join(",")')

jq -n --arg result "$RESULT" '{"metrics":$result}'
