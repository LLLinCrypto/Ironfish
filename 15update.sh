#!/bin/bash
. $HOME/.bashrc
. $HOME/.bash_profile
mkdir -p ~/if_wallet/backup/
echo $IRONFISH_NODENAME
INN=$IRONFISH_NODENAME
export INN=$INN >> $HOME/.bash_profile&&source ~/.bash_profile

ironfish accounts:export $IRONFISH_WALLET ~/if_wallet/backup/$IRONFISH_WALLET.json
echo " wallet exported"

cd ~/if_wallet/backup/
cat  $HOME/.ironfish/config.json |  tee -a nodename_graffiti.txt 
echo $INN
cat   ~/if_wallet/backup/$IRONFISH_WALLET.json
#cat  ~/ironfish_keys/$IRONFISH_WALLET.json
echo "Success!!!"
