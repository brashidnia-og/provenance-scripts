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

sudo apt install lz4

# Download snapshot
synergy_latest_snapshot_filename="provenance_24302750.tar.lz4"
synergy_latest_snapshot_filename_out="latest_synergy.tar.lz4"
synergy_latest_snapshot_url="https://support.synergynodes.com/snapshots/provenance_mainnet/$synergy_latest_snapshot_filename"
echo "latest snapshot: $synergy_latest_snapshot_url"
sudo wget ${synergy_latest_snapshot_url} -O "$PIO_MAINNET_HOME/$synergy_latest_snapshot_filename_out"
sudo lz4 -d "$PIO_MAINNET_HOME/$synergy_latest_snapshot_filename_out"


# Extract snapshot
synergy_latest_snapshot_filename_tar="latest_synergy.tar"
sudo tar -xvf "$PIO_MAINNET_HOME/$synergy_latest_snapshot_filename_tar" -C $PIO_MAINNET_HOME/
