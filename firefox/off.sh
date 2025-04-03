#!/bin/bash

# Define ANSI color codes
RESET="\033[0m"
CYAN="\033[0;36m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
GREEN="\033[0;32m"
GRAY="\033[0;90m"

DEFAULT_SLEEP=180

# If the user provided a number, use it. Otherwise, use the default.
if [[ "$1" =~ ^[0-9]+$ ]]; then
  sleep_interval="$1"
else
  sleep_interval="$DEFAULT_SLEEP"
fi
echo -e "${CYAN}[INFO] Sleep interval: $sleep_interval s.${RESET}"

# Record the start time in seconds since epoch
start_time=$(date +%s)

while true; do
  now=$(date +"%Y-%m-%d %H:%M:%S")
  current_time=$(date +%s)
  elapsed=$((current_time - start_time))

  # Convert to HH:MM:SS
  hrs=$((elapsed / 3600))
  mins=$(((elapsed % 3600) / 60))
  # secs=$((elapsed % 60))
  human_elapsed=$(printf "%02d:%02d" "$hrs" "$mins")

  firefox_net_status=$(snap connections firefox | grep "firefox:network                  :network")

  if [[ -z "$firefox_net_status" ]]; then
    echo -e "${GRAY}$now [${human_elapsed}] ${RESET}${YELLOW}[INFO] Network interface already disconnected.${RESET}"
  else
    echo -e "${GRAY}$now [${human_elapsed}] ${RESET}${RED}[ACTION] Disconnecting Firefox from network interface...${RESET}"
    sudo snap disconnect firefox:network
    if [[ $? -eq 0 ]]; then
      echo -e "${GRAY}$now [${human_elapsed}] ${RESET}${GREEN}[SUCCESS] Firefox internet access BLOCKED.${RESET}"
    else
      echo -e "${GRAY}$now [${human_elapsed}] ${RESET}${RED}[ERROR] Failed to block Firefox internet access.${RESET}"
      exit 1
    fi
  fi

  sleep "$sleep_interval"
done

