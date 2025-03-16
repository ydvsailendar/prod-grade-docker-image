# Health check loop
while true; do
  # Send GET request to GitHub API status endpoint
  response=$(curl --write-out "%{http_code}" --silent --output /dev/null https://api.github.com/status)

  # Check if the response is a 200 status code (OK)
  if [ "$response" -ne 200 ]; then
    # If not 200, notify Omega channel
    send_slack_notification "GitHub status check failed! Response code: $response" $SLACK_WEBHOOK_URL_OMEGA
  else
    echo "GitHub API is healthy! Response code: $response"
  fi

  # Wait for 5 seconds before checking again
  sleep 5
done
