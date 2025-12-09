#!/usr/bin/env bash

# Simple log filter script
# Usage: ./log-filter.sh path/to/logfile

# Check that an argument was provided
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 LOGFILE" >&2
  exit 1
fi

logfile="$1"

# Check that the file exists
if [ ! -f "$logfile" ]; then
  echo "Error: file '$logfile' does not exist." >&2
  exit 2
fi

echo "Showing ERROR and WARN lines from: $logfile"
echo

grep -E "ERROR|WARN" "$logfile"

echo
echo "Count of ERROR/WARN lines:"
grep -E "ERROR|WARN" "$logfile" | wc -l
