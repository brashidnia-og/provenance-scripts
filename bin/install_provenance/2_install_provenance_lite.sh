#!/bin/sh

output=$(echo $PIO_MAINNET_HOME)
if [[ -n $output ]]
then
  printf -- "%s\nPIO_MAINNET_HOME:" "$output"
else
  printf -- "%s\nNo value for PIO_MAINNET_HOME" "$output"
  exit 1
fi

# Initial update repository
yes | sudo apt update
yes | sudo apt-get update

# Get docker repo
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

yes | sudo apt-get install \
	ca-certificates \
	curl \
	gnupg \
	lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

yes | sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu `lsb_release -cs` test"
sudo apt update

# Update the repository
yes | sudo apt-get update

# Install wget
yes | sudo apt-get install wget

# Install unzip
yes | sudo apt-get install unzip

# Install make
yes | sudo apt install make

# Install go
wget -c https://dl.google.com/go/go1.24.3.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local
sudo echo 'PATH=$PATH:/usr/local/go/bin' >> ~/.profile
echo 'export GOROOT="/usr/local/go"'
source /etc/environment
source ~/.profile
sudo update-alternatives --install "/usr/bin/go" "go" "/usr/local/go/bin/go" 0
sudo update-alternatives --set go /usr/local/go/bin/go
sudo mkdir -p ~/.go
echo 'export GOPATH=~/.go' >> ~/.bash_profile
echo 'export PATH="$PATH:$GOPATH/bin"' >> ~/.bash_profile
source ~/.bash_profile
sudo mkdir -p ~/go/pkg
sudo chmod -R 777 ~/go/pkg

# Install git
yes | sudo apt install git-all
git --version

# Install docker
yes | sudo apt install docker.io
yes | sudo apt-get install docker-ce docker-ce-cli containerd.io

# Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/2.36.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Define PIO MAINNET dir
sudo mkdir /media/ubuntu/mainnet-0/provenance
echo 'export PIO_MAINNET_HOME=/media/ubuntu/mainnet-0/provenance' >> /home/ubuntu/.bashrc
source /home/ubuntu/.bashrc

echo 'PIO_MAINNET_HOME:'
echo $PIO_MAINNET_HOME

export PIO_MAINNET_HOME=/media/ubuntu/mainnet-0/provenance
echo 'PIO_MAINNET_HOME:'
echo $PIO_MAINNET_HOME

# Install cosmovisor (prereq: go)
sudo mkdir -p $PIO_MAINNET_HOME/cosmovisor/install
cd $PIO_MAINNET_HOME/cosmovisor/install
git clone https://github.com/cosmos/cosmos-sdk.git
cd cosmos-sdk/tools/cosmovisor
make

# Install provenance
cd
wget https://github.com/provenance-io/provenance/releases/download/v1.23.0/provenance-linux-amd64-v1.23.0.zip
unzip provenance-linux-amd64-v1.23.0.zip

sudo mkdir -p $PIO_MAINNET_HOME/cosmovisor/upgrades/yellow
sudo cp -R bin $PIO_MAINNET_HOME/cosmovisor/genesis
sudo cp -R bin $PIO_MAINNET_HOME/cosmovisor/upgrades/yellow
cd $PIO_MAINNET_HOME/cosmovisor
sudo ln -sf $PIO_MAINNET_HOME/cosmovisor/upgrades/yellow current
cd

# Additional utilities
# output formatter
yes | sudo apt install jq

cp run_pio_mainnet_1.sh $PIO_MAINNET_HOME
cd $PIO_PIO_MAINNET_HOME
sudo chmod 777 $PIO_MAINNET_HOME/run_pio_mainnet_1.sh