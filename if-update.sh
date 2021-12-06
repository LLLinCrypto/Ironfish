#!/bin/bash
#systemctl stop ironfish
service ironfishd-miner stop
service ironfishd stop
rm -rf /etc/systemd/system/ironfishd-miner.service


echo "[Unit]
Description=IronFish Miner
After=network-online.target
[Service]
User=root
ExecStart=/usr/bin/yarn --cwd /root/ironfish/ironfish-cli/ start miners:start -t 1
Restart=always
RuntimeMaxSec=36000
RestartSec=10
LimitNOFILE=10000
[Install]
WantedBy=multi-user.target" > $HOME/ironfishd-miner.service
mv $HOME/ironfishd-miner.service /etc/systemd/system/
systemctl daemon-reload
sudo systemctl restart systemd-journald
sudo systemctl restart ironfishd ironfishd-miner
