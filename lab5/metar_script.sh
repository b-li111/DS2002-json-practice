#!/bin/bash

curl -s "https://aviationweather.gov/api/data/metar?ids=KMCI&format=json&taf=false&hours=12&bbox=40%2C-90%2C45%2C-85" > aviation.json

echo "Latest Receipt Times:"
jq -r '.[0:6] | .[].receiptTime' aviation.json

average_temp=$(jq '[.[].temp] | add / length' aviation.json)
echo "Average Temperature: $average_temp"

cloudy_count=$(jq '[.[].clouds[].cover] | map(select(. != "CLR")) | length' aviation.json)
total_count=$(jq '[.[].clouds] | length' aviation.json)

if (( cloudy_count > (total_count / 2) )); then
    mostly_cloudy=true
else
    mostly_cloudy=false
fi

echo "Mostly Cloudy: $mostly_cloudy"
