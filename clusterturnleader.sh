#!/bin/bash
#systemctl stop ironfish
service ironfishd-miner stop
service ironfishd stop
cp /etc/systemd/system/ironfishd.service /etc/systemd/system/ironfishd1.service
cp /etc/systemd/system/ironfishd-miner.service /etc/systemd/system/ironfishd-miner1.service

rm -rf /etc/systemd/system/ironfishd-miner.service
rm -rf /etc/systemd/system/ironfishd.service

echo "[Unit]
Description=IronFish Node
After=network-online.target
[Service]
User=root
ExecStart=/usr/bin/yarn --cwd /root/ironfish/ironfish-cli/ start miners:start -t -1
Restart=always
RuntimeMaxSec=36000
RestartSec=10
LimitNOFILE=10000
[Install]
WantedBy=multi-user.target" > $HOME/ironfishd-miner.service
mv $HOME/ironfishd-miner.service /etc/systemd/system/

echo "[Unit]
Description=IronFish Node
After=network-online.target
[Service]
User=$USER
ExecStart=/usr/bin/yarn --cwd $HOME/ironfish/ironfish-cli/ start start --rpc.tcp --rpc.tcp.host=207.244.237.158 --rpc.tcp.port=8001
Restart=always
RestartSec=10
LimitNOFILE=10000
[Install]
WantedBy=multi-user.target
" > $HOME/ironfishd.service
echo "[Unit]
Description=IronFish Miner
After=network-online.target
[Service]
User=$USER
ExecStart=/usr/bin/yarn --cwd $HOME/ironfish/ironfish-cli/ start miners:start -t $IRONFISH_THREADS 
Restart=always
RestartSec=10
LimitNOFILE=10000
[Install]
WantedBy=multi-user.target
" > $HOME/ironfishd-miner.service
sudo mv $HOME/ironfishd.service /etc/systemd/system
sudo mv $HOME/ironfishd-miner.service /etc/systemd/system
sudo tee <<EOF >/dev/null /etc/systemd/journald.conf
Storage=persistent
EOF


systemctl daemon-reload
sudo systemctl restart systemd-journald
sudo systemctl restart ironfishd ironfishd-miner
