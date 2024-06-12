#!/bin/bash

# Get the URLs from the notification
urls=$(dunstctl history | grep -oP 'https?://[^\s]+' | uniq)

# Count the number of URLs
url_count=$(echo "$urls" | wc -l)

if [ "$url_count" -eq 1 ]; then
	# Open the single URL
	xdg-open "$urls"
else
	# Optionally handle multiple URLs (e.g., by showing a notification)
	notify-send "Multiple URLs found" "$urls"
fi
