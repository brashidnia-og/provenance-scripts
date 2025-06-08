#! /bin/bash

# https://autostake.com/networks/provenance/#services

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

sudo apt install lz4

# Download snapshot
autostake_latest_snapshot_filename="latest.tar.lz4"
autostake_latest_snapshot_filename_out="latest_autostake.tar.lz4"
autostake_latest_snapshot_url="http://snapshots.autostake.com/lyIs25DaSWMSm8evWKHGQrb/pio-mainnet-1/$autostake_latest_snapshot_filename"
echo "latest snapshot: $autostake_latest_snapshot_url"
sudo wget ${autostake_latest_snapshot_url} -O "$PIO_MAINNET_HOME/$autostake_latest_snapshot_filename_out"
sudo lz4 -d "$PIO_MAINNET_HOME/$autostake_latest_snapshot_filename_out"

# Extract snapshot
autostake_latest_snapshot_filename_tar="latest_autostake.tar"
sudo tar -xvf "$PIO_MAINNET_HOME/$autostake_latest_snapshot_filename_tar" -C $PIO_MAINNET_HOME/
