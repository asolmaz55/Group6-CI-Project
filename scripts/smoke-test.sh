#!/usr/bin/env bash
set -euo pipefail

URL="${1:-http://localhost:8080/healthz}"
MAX_ATTEMPTS=10
SLEEP_SECONDS=2

for attempt in $(seq 1 "$MAX_ATTEMPTS"); do
    if curl --fail --silent --output /dev/null "$URL"; then
        echo "OK: $URL is reachable (attempt $attempt/$MAX_ATTEMPTS)"
        exit 0
    fi
    echo "Attempt $attempt/$MAX_ATTEMPTS: $URL not reachable yet, retrying in ${SLEEP_SECONDS}s..."
    sleep "$SLEEP_SECONDS"
done

echo "FAIL: $URL did not become reachable after $MAX_ATTEMPTS attempts"
exit 1