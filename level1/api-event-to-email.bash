#!/bin/bash

source ../api_key.bash

curl  -X POST -H "Content-type: application/json" \
-d '{
      "title": "Did you hear the news today?",
      "text": "Oh boy, @kitchen@kitchen.io is gonna love this!!",
      "priority": "normal",
      "tags": ["environment:test"],
      "alert_type": "info"
  }' \
"https://app.datadoghq.com/api/v1/events?api_key=${api_key}"

