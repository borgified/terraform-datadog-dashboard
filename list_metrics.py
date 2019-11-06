#!/usr/bin/env python3

from datadog import initialize, api
import time
import json
import re
import sys

def list_metrics(json_input):
  input = json.loads(json_input)

  options = {
      'api_key': input['api_key'],
      'app_key': input['app_key']
  }

  initialize(**options)

  # Taking the last 24hours
  from_time = int(time.time()) - 60 * 60 * 24 * 1

  result = api.Metric.list(from_time)

  output = ""
  r = re.compile(r'^'+re.escape(input['prefix'])+r'\.')

  if 'errors' in result:
    output = result
    sys.exit(1)

  else:
    for metric in result['metrics']:
      if re.search(r, metric):
        m = r.sub('', metric)
        output = output + m + ","

  return(json.dumps({"metrics": output.rstrip(",")}))

def main():
  print(list_metrics(sys.stdin.read()))

main()
