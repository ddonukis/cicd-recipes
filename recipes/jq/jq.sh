```bash
# 1. convert yaml to json
# 2. create a list of key=value pairs
yq -o=json data/functions/pycat/config.yaml \
  | jq -c -r 'to_entries[] | (.key + "=", .value)' \
  | jq -R -s -r 'gsub("=\\n"; "=")'
```
