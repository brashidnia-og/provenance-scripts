#!/bin/sh

current_dir=`dirname $0`
echo "Running from ${current_dir}"

script_dir="${current_dir}/setup_node_ebs"
echo "Running scripts in ${script_dir}"

sudo chmod 777 ${script_dir}/*.sh

format_ebs_partition_path="${script_dir}/1_format_partition.sh"
echo "Running ${format_ebs_partition_path}"
sudo ${format_ebs_partition_path}

mount_disk_script_path="${script_dir}/2_mount_disk.sh"
echo "Running ${mount_disk_script_path}"
sudo ${mount_disk_script_path}