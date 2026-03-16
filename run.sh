#!/bin/bash

# Current date (ex. 2026-03-16) is the csv file name
file_name=$(date +%F)

# Basic data to obtain
current_date_time=$(date +"%FT%T%z")
current_battery=$(pmset -g batt | grep -Eo "\d+%")

# Wrapper for oascript run -- this script returns active window
# (what I am looking at)
current_window=$(osascript osascripts/frontmost-window.applescript)

# Wrapper for oascript run -- this script returns the URL for
# the current tab and the number of tabs
chrome_info=($(osascript osascripts/chrome-info.applescript))
active_chrome_tab_url=${chrome_info[0]%?}
num_chrome_tabs=${chrome_info[1]}

DATA_ROW="$current_date_time,$current_battery,$current_window,$num_chrome_tabs,$active_chrome_tab_url"

echo $DATA_ROW
