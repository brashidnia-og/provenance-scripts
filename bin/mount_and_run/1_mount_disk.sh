#!/bin/sh

source ~/.bashrc

output="$(echo $PIO_MAINNET_HOME)"
if [[ -n $output ]]
then
  printf -- "%s\nPIO_MAINNET_HOME:" "$output"
else
  printf -- "%s\nNo value for PIO_MAINNET_HOME" "$output"
  exit 1
fi

sudo mkdir -p $PIO_MAINNET_HOME

sudo mount /dev/nvme1n1 $PIO_MAINNET_HOME

df -H

ls -la $PIO_MAINNET_HOME
