#!/bin/bash

# Use kubectl top to get resource usage statistics for all pods in the specified namespace
kubectl top pod -n "$NAMESPACE" | tail -n +2 | while read line; do
  # Extract CPU and memory usage from the output
  NAME=$(echo "$line" | awk '{print $1}')
  CPU=$(echo "$line" | awk '{print $2}')
  MEMORY=$(echo "$line" | awk '{print $3}')

  # Output the statistics to the console in a table format with borders
  printf "+-----------------------+------------------------+-----------------------+----------------------+\n"
  printf "| %-21s | %-22s | %-21s | %-20s |\n" "NAMESPACE" "NAME" "CPU(cores)" "MEMORY(bytes)"
  printf "+-----------------------+------------------------+-----------------------+----------------------+\n"
  printf "| %-21s | %-22s | %-21s | %-20s |\n" "$NAMESPACE" "$NAME" "$CPU" "$MEMORY"
done
