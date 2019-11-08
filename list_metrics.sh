#!/usr/bin/env bash
# based on https://www.terraform.io/docs/providers/external/data_source.html#processing-json-in-shell-scripts

set -e

if ! [ -x "$(command -v jq)" ]; then
  curl -sL https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -o jq && chmod u+x jq
  JQ="./jq"
else
  JQ=$(command -v jq)
fi

eval "$($JQ -r '@sh "API_KEY=\(.api_key) APP_KEY=\(.app_key) PREFIX=\(.prefix)"')"

RESULT=$(curl -s -X GET \
-H "DD-API-KEY: ${API_KEY}" \
-H "DD-APPLICATION-KEY: ${APP_KEY}" \
-d "api_key=${API_KEY}" \
-d "application_key=${APP_KEY}" \
"https://api.datadoghq.com/api/v1/search?q=metrics:${PREFIX}" \
| $JQ -r --arg prefix "$PREFIX." '.results.metrics|sort|map(sub($prefix;""))|join(",")')

$JQ -n --arg result "$RESULT" '{"metrics":$result}'
