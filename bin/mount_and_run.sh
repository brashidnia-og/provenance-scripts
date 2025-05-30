#!/bin/sh

export PIO_MAINNET_HOME=/media/ubuntu/mainnet-0/provenance

current_dir=`dirname -- $0`
echo "Running from ${current_dir}"

script_dir="${current_dir}/mount_and_run"
echo "Running scripts in ${script_dir}"

sudo chmod 777 ${script_dir}/*.sh

mount_disk_path="${script_dir}/1_mount_disk.sh"
echo "Running ${mount_disk_path}"
sudo ${mount_disk_path}

run_node_path="${script_dir}/2_run_node.sh"
echo "Running ${run_node_path}"
sudo ${run_node_path}
