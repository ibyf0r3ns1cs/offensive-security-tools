#!/bin/bash

INPUT="site_list.txt"
OUTPUT="sharepoint_detected.csv"

echo "domain,detected,version_or_method" > "$OUTPUT"

# Enhanced SharePoint fingerprint pattern
FINGERPRINT_PATTERN="Microsoft SharePoint|sp.js|MSOWebPartPage|_layouts/15"

while read -r HOST; do
  echo "[*] Scanning $HOST ..."
  URL="https://$HOST"

  # Step 1: Try OPTIONS header for SharePoint version
  VERSION=$(curl -s -I -X OPTIONS --connect-timeout 5 "$URL" \
    | grep -i "^MicrosoftSharePointTeamServices:" \
    | awk '{print $2}' | tr -d '\r')

  if [ -n "$VERSION" ]; then
    echo "[_] $HOST is SharePoint (header version: $VERSION)"
    echo "$HOST,true,$VERSION" >> "$OUTPUT"
    continue
  fi

  # Step 2: Fallback to HTML detection with redirect support (-L)
  HTML_SIG=$(curl -Ls --connect-timeout 5 "$URL" \
    | grep -Eoi "$FINGERPRINT_PATTERN" | head -n 1)

  if [ -n "$HTML_SIG" ]; then
    echo "[_] $HOST is SharePoint (HTML match: $HTML_SIG)"
    echo "$HOST,true,html:$HTML_SIG" >> "$OUTPUT"
  else
    echo "[_] $HOST is not SharePoint"
    echo "$HOST,false," >> "$OUTPUT"
  fi

done < "$INPUT"

echo "[__] Done. Results saved to $OUTPUT"
