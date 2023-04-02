#!/bin/sh

echo "Restarting Server"
adb kill-server
adb start-server

echo "Checking for device"

devices=$(adb devices | tail -n +2)
if [[ -z "${adb_devices// }" ]]; then
  echo "No devices found"
  exit 1
fi

# Sync Music

echo "Syncing Music"
./better-adb-sync/src/adbsync.py push ~/media/music /sdcard/Music/


