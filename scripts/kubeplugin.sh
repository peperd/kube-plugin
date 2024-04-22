#!/bin/bash

# Function to print a line of the table
print_line() {
    printf "+-----------------------+------------------------+-----------------------+----------------------+\n"
}

# Function to print the column headers
print_headers() {
    printf "| %-30s | %-30s | %-15s | %-15s |\n" "NAMESPACE" "NAME" "CPU(cores)" "MEMORY(bytes)"
}

# Print the table headers
print_line
print_headers
print_line

# Use kubectl top to get resource usage statistics for all pods in the specified namespace
kubectl top pod -n "$NAMESPACE" | tail -n +2 | while read line; do
  # Extract CPU and memory usage from the output
  NAME=$(echo "$line" | awk '{print $1}')
  CPU=$(echo "$line" | awk '{print $2}')
  MEMORY=$(echo "$line" | awk '{print $3}')

  # Output the statistics to the console in a table format
  printf "| %-30s | %-30s | %-15s | %-15s |\n" "$NAMESPACE" "$NAME" "$CPU" "$MEMORY"
done

# Print the bottom line of the table
print_line