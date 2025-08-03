#!/bin/bash

get_gpu_usage() {
    local output=$(timeout 3s intel_gpu_top -o - 2>/dev/null)

    # Extract RCS percentage (9th column in the data rows)
    local result=$(echo "$output" | awk '
        NR > 2 && /^[[:space:]]*[0-9]/ {
            # Skip header lines, process data lines
            usage = int($9)
            if (usage >= 0 && usage <= 100) {
                print usage
            }
        }
    ' | tail -n1)

    if [[ "$result" =~ ^[0-9]+$ ]]; then
        echo "$result"
    else
        echo "0"
    fi
}

get_gpu_usage
