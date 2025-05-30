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

cd $PIO_MAINNET_HOME

sudo ./run_pio_mainnet_1.sh
