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

current_dir=`dirname -- $0`
echo "Running from ${current_dir}"

script_dir="${current_dir}/download_snapshot"
echo "Running scripts in ${script_dir}"

sudo chmod 777 ${script_dir}/*.sh

download_highstakes_path="${script_dir}/1_download_snapshot_highstakes.sh"
echo "Running ${download_highstakes_path}"
source ${download_highstakes_path}

download_auto_stake_path="${script_dir}/2_download_snapshot_autostake.sh"
echo "Running ${download_auto_stake_path}"
source ${download_auto_stake_path}

download_synergy_path="${script_dir}/3_download_snapshot_synergy.sh"
echo "Running ${download_synergy_path}"
source ${download_synergy_path}
