#!/bin/sh

# Fungsi untuk mendapatkan kapasitas baterai headset
get_headset_battery() {
  # Ambil semua perangkat dari upower
  devices=$(upower -d | grep "Device" | awk '{print $2}')

  # Loop melalui semua perangkat untuk mencari headset
  for device in $devices; do
    # Periksa apakah perangkat adalah headset
    if echo "$device" | grep -q "headset"; then
      device_name=$(upower -i "$device" | grep "model" | awk -F: '{print $2}' | xargs)
      battery_level=$(upower -i "$device" | grep "percentage" | awk -F: '{print $2}' | xargs)

      # Tampilkan nama perangkat dan kapasitas baterai
      echo "$device_name: $battery_level"
      return
    fi
  done

  # Jika tidak ada perangkat headset
  echo "No headset connected"
}

# Jalankan fungsi
get_headset_battery

