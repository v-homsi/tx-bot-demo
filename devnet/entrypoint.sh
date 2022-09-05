#!/bin/sh
set -e

geth --networkid 777 --datadir /data --http --http.addr 0.0.0.0 --http.api 'personal,eth,net,web3,txpool,miner,debug' --http.vhosts devnet \
-unlock '0xF08cBBE329D864e8246B2D9194B6CA5aC8ce20E7' --password ./password \
--mine --allow-insecure-unlock