#!/bin/bash

# A simple Nginx log analyser script
  log_file="nginx-access.log"

  if [ ! -f "$log_file" ]; then
    echo "Log file $log_file does not exist."
    elif [ ! -r "$log_file" ]; then
    echo "Log file $log_file is not readable."
    else
    echo "Log file $log_file is readable."
    fi

  # Extract the IP addresses from the log file
  ip_addresses=$(awk '{print $1}' "$log_file" | sort | uniq -c | sort -nr | head -n 5)

  # Extract the user agents from the log file
  user_agents=$(awk '{print $12}' "$log_file" | sort | uniq -c | sort -nr | head -n 5)

  # Extract the HTTP status codes from the log file
  status_codes=$(awk '{print $9}' "$log_file" | sort | uniq -c | sort -nr | head -n 5)

  # Extract the request URLs from the log file
  request_urls=$(awk '{print $7}' "$log_file" | sort | uniq -c | sort -nr | head -n 5)

  # Print the results
  echo "Top IP addresses:"
  echo "$ip_addresses"

  echo "Top user agents:"
  echo "$user_agents"

  echo "Top HTTP status codes:"
  echo "$status_codes"

  echo "Top request URLs:"
  echo "$request_urls"
