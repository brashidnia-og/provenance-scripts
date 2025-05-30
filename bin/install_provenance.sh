#!/bin/sh

current_dir=`dirname -- $0`
echo "Running from ${current_dir}"

script_dir="${current_dir}/install_provenance"
echo "Running scripts in ${script_dir}"

sudo chmod 777 ${script_dir}/*.sh

mount_disk_path="${script_dir}/1_mount_disk.sh"
echo "Running ${mount_disk_path}"
sudo ${mount_disk_path}

run_node_path="${script_dir}/2_install_provenance_lite.sh"
echo "Running ${run_node_path}"
sudo ${run_node_path}

run_download_path="${script_dir}/3_download_snapshot.sh"
echo "Running ${run_download_path}"
sudo ${run_download_path}
