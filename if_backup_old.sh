#!/bin/bash
. $HOME/.bashrc
. $HOME/.bash_profile
mkdir -p /root/ironfish/ironfish-cli/backup/
echo $IRONFISH_NODENAME
INN=$IRONFISH_NODENAME
export INN=$INN >> $HOME/.bash_profile&source ~/.bash_profile
cd /root/ironfish/ironfish-cli/backup/ 
echo " folder created"
      sudo ironfish accounts:export $IRONFISH_NODENAME /root/ironfish/ironfish-cli/backup/$IRONFISH_NODENAME.txt && sleep 5
echo " Nodename exported"

      sudo ironfish accounts:export  $IRONFISH_WALLET $IRONFISH_WALLET.json && sleep 5
echo " wallet exported"

cd /root/ironfish/ironfish-cli/
cp $IRONFISH_WALLET.json /root/ironfish/ironfish-cli/backup/ 
echo "wallet copied"
cd /root/ironfish/ironfish-cli/backup/
cat  $HOME/.ironfish/config.json |  tee -a nodename_graffiti.txt 
echo $INN
echo "Success!!!"
