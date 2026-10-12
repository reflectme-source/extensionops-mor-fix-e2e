#!/bin/bash
# SYNTHETIC AND NON-FUNCTIONAL: DO NOT EXECUTE
set -euo pipefail
ITEM_ID="${CHROME_EXTENSION_ID:?test}"
ZIP_FILE="${1:-dummy.zip}"
ACCESS_TOKEN="${CWS_ACCESS_TOKEN:?test}"

curl \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -X PUT \
  -T "$ZIP_FILE" \
  "https://www.googleapis.com/upload/chromewebstore/v1.1/items/${ITEM_ID}"

curl \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -X POST \
  -d '{"target":"default"}' \
  "https://www.googleapis.com/chromewebstore/v1.1/items/${ITEM_ID}/publish"
