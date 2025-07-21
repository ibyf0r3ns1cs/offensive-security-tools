#!/bin/bash

INPUT="site_list.txt"
OUTPUT="sharepoint_detected.csv"

echo "domain,detected,version_or_method" > "$OUTPUT"

while read -r HOST; do
  echo "[*] Scanning $HOST ..."
  URL="https://$HOST"

  # Attempt to detect SharePoint via OPTIONS header
  VERSION=$(curl -s -I -X OPTIONS --connect-timeout 5 "$URL" \
    | grep -i "^MicrosoftSharePointTeamServices:" \
    | awk '{print $2}' | tr -d '\r')

  if [ -n "$VERSION" ]; then
    echo "[_] $HOST is SharePoint (header version: $VERSION)"
    echo "$HOST,true,$VERSION" >> "$OUTPUT"
    continue
  fi

  # Fallback: basic HTML fingerprint detection
  HTML_SIG=$(curl -s --connect-timeout 5 "$URL" \
    | grep -Eoi "(Microsoft SharePoint|sp.js|MSOWebPartPage|_layouts/15/)" | head -n 1)

  if [ -n "$HTML_SIG" ]; then
    echo "[_] $HOST is SharePoint (HTML detected)"
    echo "$HOST,true,html" >> "$OUTPUT"
  else
    echo "[_] $HOST is not SharePoint"
    echo "$HOST,false," >> "$OUTPUT"
  fi

done < "$INPUT"

echo "[__] Done. Results saved to $OUTPUT"
