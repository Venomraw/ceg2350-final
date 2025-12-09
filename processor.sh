#!/bin/bash

# Default values
FILENAME=""
HELP_REQUESTED=0

# --- 1. Define the Options String ---
# "f:" means -f requires an argument (a colon means it expects a value)
# "h" means -h is a simple flag (no colon, no value expected)
OPTIONS_STRING="f:h"

# --- 2. Process the Options ---
while getopts $OPTIONS_STRING opt; do
    case $opt in
        # Case 1: Option -f (requires argument)
        f)
            FILENAME=$OPTARG
            ;;
        # Case 2: Option -h (simple flag)
        h)
            HELP_REQUESTED=1
            ;;
        # Case 3: Error (invalid option)
        \?)
            echo "Error: Invalid option -$OPTARG." >&2
            exit 1
            ;;
        # Case 4: Missing argument (e.g., just '-f' without a filename)
        :)
            echo "Error: Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

# --- 3. Shift Positional Parameters ---
# Discards the options (-f file.txt) that getopts already processed.
shift "$((OPTIND - 1))"

# --- 4. Main Logic ---

# Check for help request
if [ $HELP_REQUESTED -eq 1 ]; then
    echo "Usage: $0 -f <filename> [-h]"
    echo "Processes the specified file."
    exit 0
fi

# Check for required argument
if [ -z "$FILENAME" ]; then
    echo "Error: Filename is required. Use -h for help."
    exit 1
fi

echo "--- Processing Started ---"
echo "Filename: $FILENAME"

# Any remaining non-option arguments are in $1, $2, etc.
if [ -n "$1" ]; then
    echo "Note: Found extra argument(s): $@"
fi
