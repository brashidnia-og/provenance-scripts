#! /bin/bash

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

echo 'DATE:'
echo $date

#wget https://tools.highstakes.ch/files/provenance/goleveldb/data_${date}-09.tar.gz

sudo tar -xzvf data_${date}-09.tar.gz -C $PIO_MAINNET_HOME