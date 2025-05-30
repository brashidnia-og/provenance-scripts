#! /bin/bash

export PIO_MAINNET_HOME="$(pwd)"
export PIO_HOME="${PIO_MAINNET_HOME}"
export DAEMON_NAME="provenanced"
export DAEMON_HOME="${PIO_MAINNET_HOME}"
export DAEMON_ALLOW_DOWNLOAD_BINARIES="true"
export DAEMON_RESTART_AFTER_UPGRADE="true"

${PIO_MAINNET_HOME}/cosmovisor/install/cosmos-sdk/tools/cosmovisor/cosmovisor run start --home $PIO_MAINNET_HOME \
        --log_format json

