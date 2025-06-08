#! /bin/bash

source ~/.bashrc

output=$(echo $PIO_MAINNET_HOME)
if [[ -n $output ]]
then
  printf -- "%s\nPIO_MAINNET_HOME:" "$output"
else
  printf -- "%s\nNo value for PIO_MAINNET_HOME" "$output"
  exit 1
fi

echo 'PIO_MAINNET_HOME:'
echo $PIO_MAINNET_HOME

# Derive filename
highstakes_snapshot_date=$(date -u +'%Y-%m-%d')

echo 'DATE UTC:'
echo $highstakes_snapshot_date

current_utc_hour=$(date -u +%H)
highstakes_snapshot_hour=$(printf "%02d" "$((current_utc_hour - (current_utc_hour % 3)))")

echo 'highstakes_snapshot_hour:'
echo $highstakes_snapshot_hour

# Download snapshot
highstakes_snapshot_filename="data_$highstakes_snapshot_date-$highstakes_snapshot_hour.tar.gz"
highstakes_snapshot_filename_out="latest_highstakes.tar.gz"
echo 'latest snapshot:'
echo "https://tools.highstakes.ch/files/provenance/goleveldb/$highstakes_snapshot_filename"
sudo wget "https://tools.highstakes.ch/files/provenance/goleveldb/$highstakes_snapshot_filename" -O "$PIO_MAINNET_HOME/$highstakes_snapshot_filename_out"

# Extract snapshot
sudo tar -xzvf $PIO_MAINNET_HOME/$highstakes_snapshot_filename_out -C $PIO_MAINNET_HOME/