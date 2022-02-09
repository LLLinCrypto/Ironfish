#!/bin/bash
#systemctl stop ironfish
service ironfishd-miner stop
service ironfishd stop
sudo cp /etc/systemd/system/ironfishd-miner_backup.service /etc/systemd/system/ironfishd-miner.service


systemctl daemon-reload
sudo systemctl restart systemd-journald
sudo systemctl restart ironfishd ironfishd-miner
