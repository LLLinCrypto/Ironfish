#!/bin/bash
. $HOME/.bashrc
. $HOME/.bash_profile
mkdir -p /root/ironfish/ironfish-cli/backup/
echo $IRONFISH_NODENAME
cd /root/ironfish/ironfish-cli/backup/ 
ironfish accounts:export $IRONFISH_NODENAME /root/ironfish/ironfish-cli/backup/$IRONFISH_NODENAME.txt
ironfish accounts:export  $IRONFISH_WALLET $IRONFISH_WALLET.json
cd /root/ironfish/ironfish-cli/
cp $IRONFISH_WALLET.json /root/ironfish/ironfish-cli/backup/ 
cd /root/ironfish/ironfish-cli/backup/
cat  $HOME/.ironfish/config.json | sudo tee -a nodename_graffiti.txt 
