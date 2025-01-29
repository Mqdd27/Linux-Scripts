#!/bin/sh

for i in {10..1}; do
  notify-send "🌙 Sleep" "⏳ Sleeping in $i sec..." -t 1000
  sleep 1
done

systemctl suspend

